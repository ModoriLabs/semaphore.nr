# semaphore.nr

## Getting Started

```sh
# Build circuits, generate verifier contract
(cd packages/semaphore && ./script/build.sh)

# Use JS to generate proof and save to a file
cd js
npm install
npx ts-node generate-proof.ts

# foundry test read generated proof and verify
(cd pakcages/contracts && forge test --optimize --optimizer-runs 5000 --gas-report -vvv)
```

<img width="895" alt="Image" src="https://github.com/user-attachments/assets/77c9edf9-4ec7-449a-b805-4196ee55822e" />

## Test

```sh
(cd tests && nargo test)
```

## Reference

- <https://github.com/vplasencia/semaphore-benchmarks/blob/main/circom-snarkjs/circuits/semaphore-v4/semaphore-v4.circom>
- <https://github.com/saleel/ultrahonk-solidity-sample>
