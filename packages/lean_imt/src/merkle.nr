pub struct MerkleTree<T> {
    pub root: T,
    pub hasher: fn([T; 2]) -> T,
}

impl<T> MembershipProver<T, T> for MerkleTree<T>
where
    T: Eq + Default,
{
    fn membership<let N: u32>(self, leaf: T, indexes: Field, hash_path: [T; N]) {
        let root = self.calculate_root(leaf, indexes, hash_path);
        assert(self.root == root);
    }
}

impl<T> Calculator<T, T> for MerkleTree<T>
where
    T: Eq + Default,
{
    fn calculate_root<let N: u32>(self, leaf: T, indexes: Field, hash_path: [T; N]) -> T {
        let index_bits: [u1; N] = indexes.to_le_bits();
        let mut node = leaf;
        for i in 0..hash_path.len() {
            let sibling = hash_path[i];
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
        node
    }
}
