// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {HonkVerifier} from "../src/base/HonkVerifier.sol";

contract SemaphoreVerifierTest is Test {
    HonkVerifier public honkVerifier;

    function setUp() public {
        honkVerifier = new HonkVerifier();
    }

    function test_VerifyProof() external view {
        bytes memory honkProof = vm.readFileBinary(
            "../semaphore/target/proof-clean"
        );
        console.logBytes(honkProof);
        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier
        assertTrue(honkVerifier.verify(honkProof, publicInputs));
    }
}
