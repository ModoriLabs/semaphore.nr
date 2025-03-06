import { UltraHonkBackend } from "@aztec/bb.js";
import fs from "fs";
import circuit from "../semaphore/target/semaphore.json";
// @ts-ignore
import { Noir } from "@noir-lang/noir_js";


(async () => {
  try {
    const noir = new Noir(circuit as any);
    const honk = new UltraHonkBackend(circuit.bytecode, { threads: 1 });

    const inputs = {
      indexes: "1", // NOTE: The 5th leaf has only one sibling
      message: "1",
      scope: "1",
      secret: "5",
      paths: {
        len: "1",
        storage: [
          "0x1d04d957ef6364c51a27258dd9ca5622e2113cba6858e4634fdb2ff12743c909",
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
        ],
      },
    };
    const { witness } = await noir.execute(inputs);
    const { proof, publicInputs } = await honk.generateProof(witness, { keccak: true });

    const cleanProof = proof.slice(4); // remove first 4 bytes (buffer size)

    // save proof to file
    fs.writeFileSync("../semaphore/target/proof-clean", cleanProof);

    // not really needed as we harcode the public input in the contract test
    fs.writeFileSync("../semaphore/target/public-inputs", JSON.stringify(publicInputs));
  } catch (error) {
    console.error(error);
  }
})();
