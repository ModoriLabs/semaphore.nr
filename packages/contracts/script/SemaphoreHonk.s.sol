// SPDX-License-Identifier: MIT
pragma solidity >=0.8.25 <0.9.0;

import { BaseScript } from "./Base.s.sol";
import { HonkVerificationKeys } from "../src/base/HonkVerificationKeys.sol";
import { SemaphoreHonkVerifier } from "../src/base/SemaphoreHonkVerifier.sol";
import { SemaphoreHonk } from "../src/SemaphoreHonk.sol"; // Adjust the path as needed
import { console } from "forge-std/console.sol";

contract DeploySemaphoreHonk is BaseScript {
    function run() public broadcast returns (SemaphoreHonk) {
        console.log("Deploying SemaphoreHonk...");

        // Deploy the SemaphoreHonk contract
        HonkVerificationKeys verificationKeys = new HonkVerificationKeys();

        SemaphoreHonkVerifier semaphoreHonkVerifier = new SemaphoreHonkVerifier(address(verificationKeys));
        SemaphoreHonk semaphoreHonk = new SemaphoreHonk(semaphoreHonkVerifier);

        console.log("SemaphoreHonk deployed at:", address(semaphoreHonk));

        // Write deployment info to file
        _writeDeployment("SemaphoreHonk", address(semaphoreHonk));

        return semaphoreHonk;
    }
}
