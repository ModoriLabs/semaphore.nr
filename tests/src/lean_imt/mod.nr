use BoundedVec;
use lean_imt::lean_imt::LeanMerkleTree;
use std::hash::pedersen_hash;

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

    let hash_path: BoundedVec<Field, 1> = BoundedVec::from_array([internal[2]]);
    let root = mt.calculate_root(nodes[4], 0x01, hash_path);
    println(f"root: {root}");
    assert(root == expected_root);
}

#[test]
fn test_lean_incremental_merkle_tree_root_with_zero_nodes() {
    let expected_root = 0x00;
    let mt = LeanMerkleTree::from(expected_root, pedersen_hash);

    let path: BoundedVec<Field, 1> = BoundedVec::new();
    let root = mt.calculate_root(0x00, 0x00, path);
    println(f"root: {root}");
    assert(root == expected_root);
}

#[test]
fn test_lean_incremental_merkle_tree_root_with_one_node() {
    let mut nodes = [0x01];
    let expected_root = nodes[0];
    let mt = LeanMerkleTree::from(expected_root, pedersen_hash);

    let path: BoundedVec<Field, 1> = BoundedVec::new();

    let root = mt.calculate_root(nodes[0], 0x00, path);
    println(f"root: {root}");
    assert(root == expected_root);
}

// 01 02 03 04 05
#[test]
fn test_merkle_tree_membership() {
    let root = 0x2d4614e38bf10dd9c1e9ea68cb85be973afad48f3c1ac556b79c928a4aaf8827;
    let mt = LeanMerkleTree::from(root, pedersen_hash);

    let leaf = 0x01;
    let paths: BoundedVec<Field, 3> = BoundedVec::from_array([
        0x02,
        0x0714067c255d6ff2d20d01d74654d05ec8fcb214a4a3971504a465d8a3b8b0c8,
        0x05,
    ]);

    mt.membership(leaf, 0x00, paths);
    println(f"root: {root}");
}
