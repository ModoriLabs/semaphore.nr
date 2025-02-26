pub use crate::types::{Calculator, LIMT_Creator, MembershipProver};

pub struct LeanMerkleTree<T> {
    pub root: T,
    pub hasher: fn([T; 2]) -> T,
}

impl<T> LIMT_Creator<T> for LeanMerkleTree<T>
where
    T: Eq + Default,
{
    fn default(root: T, hasher: fn([T; 2]) -> T) -> Self {
        Self { root, hasher }
    }

    fn from(root: T, hasher: fn([T; 2]) -> T) -> Self {
        Self::default(root, hasher)
    }

    fn new(hasher: fn([T; 2]) -> T) -> Self {
        Self::from(T::default(), hasher)
    }
}

impl<T> MembershipProver<T, T> for LeanMerkleTree<T>
where
    T: Eq + Default,
{
    fn membership<let N: u32>(self, leaf: T, indexes: Field, hash_path: [T; N]) {
        let root = self.calculate_root(leaf, indexes, hash_path);
        assert(self.root == root);
    }
}

impl<T> Calculator<T, T> for LeanMerkleTree<T>
where
    T: Eq + Default,
{
    fn calculate_root<let N: u32>(self, leaf: T, indexes: Field, hash_path: [T; N]) -> T {
        println(f"N: {N}");
        let index_bits: [u1; N] = indexes.to_le_bits();
        let mut node = leaf;
        for i in 0..hash_path.len() {
            let sibling = hash_path[i];
            println(f"sibling: {sibling}");
            if sibling != T::default() {
                println("not default");
                if index_bits[i] == 0 {
                    let left = node;
                    let right = sibling;
                    node = (self.hasher)([left, right]);
                } else {
                    let left = sibling;
                    let right = node;
                    node = (self.hasher)([left, right]);
                }
            }
        }
        node
    }
}
