use edwards::{Curve};
use edwards::bjj::BabyJubJubParams;
use edwards::ScalarField;
use std::{hash::poseidon};
use lean_imt::lean_imt::{LeanMerkleTree, Calculator};

global MAX_PATH_LENGTH: u32 = 32;

fn commit_identity(secret: Field) -> Field {
    let eddsa_pub = eddsa_to_pub(secret);
    // bn254 and babyjubjub have the same base field
    let hash = poseidon::bn254::hash_2([eddsa_pub.x, eddsa_pub.y]);
    hash
}

fn eddsa_to_pub(secret: Field) -> Curve<BabyJubJubParams> {
    let (bx, by) = BabyJubJubParams::gen();
    // We know that the point is on the curve, so Curve::new is not needed
    // https://github.com/noir-lang/noir-edwards/blob/main/src/lib.nr#L132
    let base_point: Curve<BabyJubJubParams> = Curve::from((bx, by));
    let secret_scalar: ScalarField<63> = ScalarField::from(secret);

    base_point.mul(secret_scalar)
}

fn main(
    secret: Field,
    indexes: Field,
    paths: BoundedVec<Field, MAX_PATH_LENGTH>,
    message: pub Field,
    scope: pub Field,
) -> pub (Field, Field) {
    let leaf = commit_identity(secret);
    // FIXME: temporary root 0x00 is given
    let mt = LeanMerkleTree::from(0x00, poseidon::bn254::hash_2);
    let calculated_root = mt.calculate_root(leaf, indexes, paths);
    let nullifier = poseidon::bn254::hash_2([scope, secret]);
    (calculated_root, nullifier)
}

#[test]
fn test_commit_identity() {
    let secret = 0x02;
    let (bx, by) = BabyJubJubParams::gen();
    let point: Curve<BabyJubJubParams> = Curve { x: bx, y: by };
    let secret_scalar: ScalarField<63> = ScalarField::from(secret);
    let pub_key = point.mul(secret_scalar);
    let expected = poseidon::bn254::hash_2([pub_key.x, pub_key.y]);

    let result = commit_identity(secret);
    assert(result == expected);
    println(f"result: {result}");
    println(f"expected: {expected}");
}

// poseidon(1B) = 0x1f8dd4a8d9c95bc9e87a9074914e04dccf3cd308ad6d0848df14ea5752e2b298
// poseidon(2B) = 0x05415952b4ee4ce9eaabe1968363381648371c7b27e015042b89e9d8fef636c7
// poseidon(3B) = 0x0ad543ec877959363038bd7964b835c39e73eb015f7e10f46b1418ee0657c72a
// poseidon(4B) = 0x2d85e11b9548fdce70f9ea8d4245fd6d27046857122b2b13d29a4f151ffbbaf7
// poseidon(5B) = 0x1c23eca7cb35d494c832d3a19bab0d4abfc4fbc3958ac82650fc25ec7ab3532e
#[test]
fn test_main() {
    let secrets = [0x01, 0x02, 0x03, 0x04, 0x05];
    let identities = [commit_identity(secrets[0]), commit_identity(secrets[1]), commit_identity(secrets[2]), commit_identity(secrets[3]), commit_identity(secrets[4])];
    // NOTE: The index of the leaf 0x05 is 0x01 because only one hash path is given
    let indexes = 0x01;
    let message = 0x01;
    let scope = 0x01;

    let mut internal = [0x00; 32];
    internal[0] = poseidon::bn254::hash_2([identities[0], identities[1]]);
    println(internal[0]); // 0x06d328e1ca024bb8747475691c0eaedb37adddc8689ce68fe4114c1e039fb31d
    internal[1] = poseidon::bn254::hash_2([identities[2], identities[3]]);
    println(internal[1]); // 0x24aec9f2eab663b33cf2c6e191ec843cb78a3f586995296edc33beb3457e015e
    internal[2] = poseidon::bn254::hash_2([internal[0], internal[1]]);
    println(internal[2]); // 0x1d04d957ef6364c51a27258dd9ca5622e2113cba6858e4634fdb2ff12743c909
    let expected_root = poseidon::bn254::hash_2([internal[2], identities[4]]);
    println(expected_root); // 0x1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9

    let paths: BoundedVec<Field, MAX_PATH_LENGTH> = BoundedVec::from_array([internal[2]]);
    let (root, nullifier) = main(secrets[4], indexes, paths, message, scope);
    println(f"nullifier: {nullifier}"); // 0x07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89
    println(f"root: {root}");

    assert(root == expected_root);
}

// Use the fixture from https://github.com/semaphore-protocol/semaphore/blob/main/packages/contracts/test/Semaphore.ts#L326-L328
#[test]
fn test_main2() {
    let secrets = [
        923051498351556297071660122379875464705179920688629809443263349625450902044,
        1978755119068081247093963160279604962264019399313700915496711871956252953559,
        180011252386902481731817865914295220342827624875569997039374307850655534216,
    ];
    let identities = [
        5407869850562333726769604095330004527418297248703115046359956082084347839061, // 0x0bf4bef11e443d35b2bcecdf19f25ce3f519d6be2b0e33829691083d3ea70255
        18699903263915756199535533399390350858126023699350081471896734858638858200219,
        4446973358529698253939037684201229393105675634248270727935122282482202195132,
    ];
    // NOTE: The index of the leaf 0x00 is 0x00 because only one hash path is given
    let indexes = 0;
    let message = 0x00405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5a; // _hash(2)
    let scope = 0x00290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e5; // _hash(0)

    let mut internal = [0x00; 32];
    internal[0] = poseidon::bn254::hash_2([identities[0], identities[1]]);
    println(internal[0]); // 0x06d328e1ca024bb8747475691c0eaedb37adddc8689ce68fe4114c1e039fb31d
    let expected_root = poseidon::bn254::hash_2([internal[0], identities[2]]);
    println(expected_root); // 0x265aad7d885c5a4d4bece302f04ac298982800c85490983594290ef693fcaf55

    let paths: BoundedVec<Field, MAX_PATH_LENGTH> = BoundedVec::from_array([identities[1], identities[2]]);
    let (root, nullifier) = main(secrets[0], indexes, paths, message, scope);
    println(f"nullifier: {nullifier}"); // 0x15fc910d3c6dc6bf2362c2c1c15a8bebef733c5f6d4e1b2143e59cf9daaee6e9
    println(f"root: {root}"); // 0x265aad7d885c5a4d4bece302f04ac298982800c85490983594290ef693fcaf55

    assert(root == expected_root);
}
