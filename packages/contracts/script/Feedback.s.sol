// SPDX-License-Identifier: MIT
pragma solidity >=0.8.25 <0.9.0;

import { BaseScript } from "./Base.s.sol";
import { HonkVerificationKeys } from "../src/base/HonkVerificationKeys.sol";
import { SemaphoreHonkVerifier } from "../src/base/SemaphoreHonkVerifier.sol";
import { SemaphoreHonk } from "../src/SemaphoreHonk.sol"; // Adjust the path as needed
import { Feedback } from "../src/examples/Feedback.sol";
import { console } from "forge-std/console.sol";

contract DeployFeedback is BaseScript {
    function run() public broadcast returns (Feedback) {
        console.log("Deploying Feedback...");
        address semaphoreHonkAddress = parseAddress("SemaphoreHonk");
        Feedback feedback = new Feedback(semaphoreHonkAddress);

        console.log("Feedback deployed at:", address(feedback));

        // Write deployment info to file
        _writeDeployment("Feedback", address(feedback));

        return feedback;
    }
}
