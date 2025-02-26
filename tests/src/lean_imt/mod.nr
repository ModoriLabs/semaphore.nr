use std::hash::pedersen_hash;
use lean_imt::merkle::{MerkleTree, MT_Creator, MembershipProver};
use lean_imt::lean_imt::LeanMerkleTree;

#[test]
fn test_merkle_tree_root() {
    let mut nodes = [0x01, 0x02, 0x03, 0x04];
    let mut internal = [0x00; 32];
    internal[0] = pedersen_hash([nodes[0], nodes[1]]); // 0x17cb544f4d22abbae88f69c706f21367d7925abb131a13836745714dc896c150
    println(internal[0]);
    internal[1] = pedersen_hash([nodes[2], nodes[3]]); // 0x0714067c255d6ff2d20d01d74654d05ec8fcb214a4a3971504a465d8a3b8b0c8
    println(internal[1]);
    internal[2] = pedersen_hash([internal[0], internal[1]]); // 0x24391b126b863e5922f1aedf7209e24111b3a0862b25406bd73cb92b708c8d7b
    println(internal[2]);

    let root = internal[2]; // 0x24391b126b863e5922f1aedf7209e24111b3a0862b25406bd73cb92b708c8d7b
    println(f"root: {root}");
}

// TODO: pass this test with Lean-IMT
#[test]
fn test_lean_incremental_merkle_tree_root() {
    let mut nodes = [0x01, 0x02, 0x03, 0x04, 0x05];
    let mut internal = [0x00; 32];
    internal[0] = pedersen_hash([nodes[0], nodes[1]]); // 0x17cb544f4d22abbae88f69c706f21367d7925abb131a13836745714dc896c150
    println(internal[0]);
    internal[1] = pedersen_hash([nodes[2], nodes[3]]); // 0x0714067c255d6ff2d20d01d74654d05ec8fcb214a4a3971504a465d8a3b8b0c8
    println(internal[1]);
    internal[2] = pedersen_hash([internal[0], internal[1]]); // 0x24391b126b863e5922f1aedf7209e24111b3a0862b25406bd73cb92b708c8d7b
    println(internal[2]);
    let expected_root = pedersen_hash([internal[2], nodes[4]]); // 0x2d4614e38bf10dd9c1e9ea68cb85be973afad48f3c1ac556b79c928a4aaf8827
    println(f"expected root: {expected_root}");

    let mt = LeanMerkleTree::from(expected_root, pedersen_hash);

    let root = mt.calculate_root(0x05, 0x04, [internal[2]]);
    println(f"root: {root}");

    // Another check
    // mt.membership(0x01, 0x00, [0x02, 0x0714067c255d6ff2d20d01d74654d05ec8fcb214a4a3971504a465d8a3b8b0c8, 0x05]);

    // assert(root == expected_root);
}

// TODO: test the roots of lean-imt and merkle tree are the same when the size is  2^n

// 01 02 03 04 05
#[test]
fn test_merkle_tree_membership() {
    let root = 0x2d4614e38bf10dd9c1e9ea68cb85be973afad48f3c1ac556b79c928a4aaf8827;
    let mt = LeanMerkleTree::from(root, pedersen_hash);

    let leaf = 0x01;
    let paths = [0x02, 0x0714067c255d6ff2d20d01d74654d05ec8fcb214a4a3971504a465d8a3b8b0c8, 0x05];

    mt.membership(leaf, 0x00, paths);
    println(f"root: {root}");
}
