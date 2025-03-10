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
cd -
(cd packages/contracts && forge test --optimize --optimizer-runs 5000 --gas-report)
```

<img width="813" alt="Image" src="https://github.com/user-attachments/assets/f7d314bd-cc7a-4206-8dd3-cc24c1565a3a" />

## Test

### contracts

```sh
(cd packages/contracts && forge test --optimize --optimizer-runs 5000 --gas-report)
```

### circuit

```sh
# main circuit
(cd packages/semaphore && nargo test)

# lean_imt circuit
(cd tests && nargo test)
```

### UltraPlonk

```sh
(cd packages/semaphore && ./script/build.sh 32 ultra)

cd js
npx ts-node generate-ultra-proof.ts --depth=32  # for SemaphoreHonkVerifier.t.sol default depth is 32

cd -
(cd packages/contracts && forge test --mc UltraVerifierTest --optimize --optimizer-runs 5000 --gas-report)
```

## Contract Addresses

### sepolia

| Contracts              | Address                                                                                                                         |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Feedback                   | [0x442dc178c85cd331d5e727348b23758ff2ca4d2f](https://sepolia.etherscan.io/address/0x442dc178c85cd331d5e727348b23758ff2ca4d2f) |
| Semaphore                   | [0xccd53b41c34edd285837ea4604e62018762bead1](https://sepolia.etherscan.io/address/0xccd53b41c34edd285837ea4604e62018762bead1) |
| SemaphoreHonkVerifier                   | [0xc2732ece3b48c8679820ca9fff5c0c842a17e963](https://sepolia.etherscan.io/address/0xc2732ece3b48c8679820ca9fff5c0c842a17e963) |
| HonkVerificationKeys                   | [0x68744c134c0d3e2aba1e0ef54a68a4bb56775cb2](https://sepolia.etherscan.io/address/0x68744c134c0d3e2aba1e0ef54a68a4bb56775cb2) |

## NOTE

- For now, the supported `MAX_DEPTH` list is `[1, 4, 8, 16, 20, 24, 28, 32]` due to the contract size limit, 24kb. If the length of `paths` is less than `MAX_DEPTH`, [`generate-proof.ts`](https://github.com/ModoriLabs/semaphore.nr/blob/main/packages/js/generate-proof.ts) will fill 0 up to `MAX_DEPTH`.

## Reference

- <https://github.com/vplasencia/semaphore-benchmarks/blob/main/circom-snarkjs/circuits/semaphore-v4/semaphore-v4.circom>
- <https://github.com/saleel/ultrahonk-solidity-sample>
