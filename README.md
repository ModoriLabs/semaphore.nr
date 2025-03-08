# semaphore.nr

## Getting Started

- nargo version = 1.0.0-beta.2
- bb version = 0.72.1

```sh
git submodule update

# Build circuits, generate verifier contract
# default depth is 32
(cd packages/semaphore && ./script/build.sh 32)

# Use JS to generate proof and save to a file
cd js
npx ts-node generate-proof.ts --depth=32  # for SemaphoreHonkVerifier.t.sol default depth is 32
npx ts-node generate-proof2.ts # for SemaphoreHonk.t.sol

# foundry tests read generated proof and verify
(cd packages/contracts && forge test --optimize --optimizer-runs 5000 --gas-report)
```

<img width="895" alt="Image" src="https://github.com/user-attachments/assets/77c9edf9-4ec7-449a-b805-4196ee55822e" />

## Test

### contracts

```sh
(cd packages/contracts && forge test --optimize --optimizer-runs 5000 --gas-report)
```

### circuit

```sh
# main circuit
(cd packages/semaphore && nargo test)

#
(cd tests && nargo test)
```

## Reference

- <https://github.com/vplasencia/semaphore-benchmarks/blob/main/circom-snarkjs/circuits/semaphore-v4/semaphore-v4.circom>
- <https://github.com/saleel/ultrahonk-solidity-sample>
