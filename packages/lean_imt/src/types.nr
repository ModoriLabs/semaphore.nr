pub trait Calculator<T, K> {
    fn calculate_root<let N: u32>(self, entry: K, indexes: Field, hash_path: [T; N]) -> T;
}
