set -e

DEPTH=${1:-32}
VERIFIER=${2:-honk}  # Default to honk, but allow "ultra" as a parameter

echo "Compiling circuit..."
if ! nargo compile; then
    echo "Compilation failed. Exiting..."
    exit 1
fi

echo "Generating vkey..."
if [ "$VERIFIER" = "ultra" ]; then
    echo "Generating ultra vkey..."
    bb write_vk -b ./target/semaphore.json -o ./target/vk -c ~/.bb-crs
else
    echo "Generating honk vkey..."
    bb write_vk_ultra_keccak_honk -b ./target/semaphore.json -o ./target/vk -c ~/.bb-crs
fi

echo "Generating solidity verifier..."
if [ "$VERIFIER" = "ultra" ]; then
    bb contract -k ./target/vk -c ~/.bb-crs -o ./target/Verifier.sol
else
    bb contract_ultra_honk -k ./target/vk -c ~/.bb-crs -o ./target/Verifier.sol
fi

if [ "$VERIFIER" = "ultra" ]; then
    mv ./target/Verifier.sol ../contracts/src/base/UltraVerifier${DEPTH}.sol
else
    mv ./target/Verifier.sol ../contracts/src/base/HonkVerifier${DEPTH}.sol
fi

echo "Done"
