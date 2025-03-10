import { UltraHonkBackend } from "@aztec/bb.js";
import fs from "fs";
import circuit from "../semaphore/target/semaphore.json";
// @ts-ignore
import { Noir } from "@noir-lang/noir_js";

const args = process.argv.slice(2);
const depthArg = args.find(arg => arg.startsWith('--depth='));

(async () => {
  try {
    const noir = new Noir(circuit as any);
    const honk = new UltraHonkBackend(circuit.bytecode, { threads: 1 });
    const depth = depthArg ? parseInt(depthArg.split('=')[1]) : 32;
    const initialStorage = [
      "0x2957c52a09aab60772031408ba9045ff20f391dd5586fc90287c8bb838a5249b",
      "0x9d4e5d15581fa78e26f737acf3c82cf22cae0f840f3ab6ee64d7189ae8634bc",
    ];

    const storageArray = [
      ...initialStorage,
      ...Array(depth - initialStorage.length).fill(0)
    ];

    // Three leaves case in test_main2
    // https://github.com/semaphore-protocol/semaphore/blob/main/packages/contracts/test/Semaphore.ts#L326-L328
    const inputs = {
      indexes: "0", // NOTE: The 1th leaf has only one sibling
      message: "0x00405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5a", // uint256(keccak256(abi.encodePacked(uint256(2)))) >> 8
      scope: "0x00290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e5", // uint256(keccak256(abi.encodePacked(uint256(0)))) >> 8
      secret: "0x20a6dbaf36c1b5463c70994a8e81cfe5d78279108645289b282bab61367b21c",
      paths: {
        len: "2",
        storage: storageArray,
      },
    };
    const { witness } = await noir.execute(inputs);
    const { proof, publicInputs } = await honk.generateProof(witness, { keccak: true });

    const cleanProof = proof.slice(4); // remove first 4 bytes (buffer size)

    // save proof to file
    fs.writeFileSync("../semaphore/target/proof-clean2", cleanProof);

    // not really needed as we harcode the public input in the contract test
    fs.writeFileSync("../semaphore/target/public-inputs2", JSON.stringify(publicInputs));
    console.log("Proof generated and saved to ../semaphore/target/proof-clean2");
    console.log("Done!")
  } catch (error) {
    console.error(error);
  }
})();
