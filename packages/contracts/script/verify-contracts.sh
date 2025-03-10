#!/bin/bash

CHAIN="sepolia"
KEYS_ADDRESS="0x68744c134c0d3e2aba1e0ef54a68a4bb56775cb2"
VERIFIER_ADDRESS="0xc2732ece3b48c8679820ca9fff5c0c842a17e963"
HONK_ADDRESS="0xCCD53B41C34edd285837EA4604E62018762beAd1"
FEEDBACK_ADDRESS="0x05337EEEc7047F509AcFfD58653d0f19F4571c42"
POSEIDON_ADDRESS="0xC2553008d84fAeC2b281a1B452b7e5b49E2cEE71"
# Verify PoseidonT3
echo "Verifying PoseidonT3 contract..."
forge verify-contract --chain $CHAIN $POSEIDON_ADDRESS PoseidonT3 --watch

# Verify HonkVerificationKeys
echo "Verifying HonkVerificationKeys contract..."
forge verify-contract --chain $CHAIN $KEYS_ADDRESS HonkVerificationKeys --watch

# Verify SemaphoreHonkVerifier with constructor args
echo "Verifying SemaphoreHonkVerifier contract..."
forge verify-contract --chain $CHAIN $VERIFIER_ADDRESS SemaphoreHonkVerifier \
  --constructor-args $(cast abi-encode "constructor(address)" $KEYS_ADDRESS) --watch

# TODO: This is failing
echo "Verifying SemaphoreHonk contract..."
forge verify-contract --chain $CHAIN $HONK_ADDRESS SemaphoreHonk \
  --constructor-args $(cast abi-encode "constructor(address)" "$VERIFIER_ADDRESS") \
  --libraries "../../node_modules/poseidon-solidity/PoseidonT3.sol:PoseidonT3:0xC2553008d84fAeC2b281a1B452b7e5b49E2cEE71" \
  --watch

echo "Verifying Feedback contract..."
forge verify-contract --chain $CHAIN $FEEDBACK_ADDRESS Feedback \
  --constructor-args $(cast abi-encode "constructor(address)" "$HONK_ADDRESS") --watch
