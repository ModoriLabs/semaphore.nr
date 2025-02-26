pub trait Calculator<T, K> {
    fn calculate_root<let N: u32>(self, entry: K, indexes: Field, hash_path: [T; N]) -> T;
}

pub trait LIMT_Creator<T> {
    pub fn default(root: T, hasher: fn([T; 2]) -> T) -> Self;

    /**
     * Imports an existing Lean Incremental Merkle Tree (LeanMerkleTree) instance.
     * @param hasher The hash function that is used to hash the nodes of the tree
     * @param root The root of the tree
     */
    pub fn from(root: T, hasher: fn([T; 2]) -> T) -> Self;

    /**
     * Creates a new Lean Incremental Merkle Tree (LeanMerkleTree) instance.
     * @param hasher The hash function that is used to hash the nodes of the tree
     */
    pub fn new(hasher: fn([T; 2]) -> T) -> Self;
}

pub trait MT_Creator<T> {
    pub fn default(root: T, hasher: fn([T; 2]) -> T) -> Self;

    /**
     * Imports an existing Merkle Tree (MerkleTree) instance.
     * @param hasher The hash function that is used to hash the nodes of the tree
     * @param root The root of the tree
     */
    pub fn from(root: T, hasher: fn([T; 2]) -> T) -> Self;

    /**
     * Creates a new Merkle Tree (MerkleTree) instance.
     * @param hasher The hash function that is used to hash the nodes of the tree
     */
    pub fn new(hasher: fn([T; 2]) -> T) -> Self;
}

pub trait MembershipProver<T, K> {
    /**
     * Proves that a leaf is a member of the tree.
     * @param leaf The leaf to prove
     * @param path The hash path and indices
     */
    pub fn membership<let N: u32>(self, entry: K, indexes: Field, hash_path: [T; N]);
}
