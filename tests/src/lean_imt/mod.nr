use std::hash::pedersen_hash;
use lean_imt::merkle::{MerkleTree, MT_Creator, MembershipProver};

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
fn test_merkle_tree_membership() {
    let root = 0x24391b126b863e5922f1aedf7209e24111b3a0862b25406bd73cb92b708c8d7b;
    let mt = MerkleTree::from(root, pedersen_hash);

    let leaf = 0x01;
    let paths = [0x02, 0x0714067c255d6ff2d20d01d74654d05ec8fcb214a4a3971504a465d8a3b8b0c8];

    mt.membership(leaf, 0x00, paths);

    println(f"root: {root}");
}
