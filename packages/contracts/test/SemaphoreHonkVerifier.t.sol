// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {SemaphoreHonkVerifier} from "../src/base/SemaphoreHonkVerifier.sol";
import {HonkVerificationKeys} from "../src/base/HonkVerificationKeys.sol";

contract SemaphoreHonkVerifierTest is Test {
    SemaphoreHonkVerifier public semaphoreHonkVerifier;
    HonkVerificationKeys public verificationKeys;

    function setUp() public {
        // uint256 numPublicInputs = 4;
        verificationKeys = new HonkVerificationKeys();
        semaphoreHonkVerifier = new SemaphoreHonkVerifier(address(verificationKeys));
    }

    // depth 1 ~ 6: logN = 14
    // depth 7 ~ 13: logN = 15
    // depth 14 ~ 31: logN = 16
    // depth 32: logN = 17
    function test_VerifyProof_WhenTreeDepthIs1To32() external view {
        uint256[] memory depths = new uint256[](8);
        depths[0] = 1;
        depths[1] = 4;
        depths[2] = 8;
        depths[3] = 16;
        depths[4] = 20;
        depths[5] = 24;
        depths[6] = 28;
        depths[7] = 32;

        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier
        for (uint256 i = 0; i < depths.length; i++) {
            uint256 maxDepth = depths[i];
            console.log("maxDepth: ", maxDepth);
            bytes memory honkProof =
                vm.readFileBinary(string.concat("../semaphore/target/proof-clean-depth", vm.toString(maxDepth)));
            // console.logBytes(honkProof);
            assertTrue(
                semaphoreHonkVerifier.verify(honkProof, publicInputs, maxDepth),
                string.concat("Failed for depth: ", vm.toString(i))
            );
        }
    }

    // when logN = 14
    function test_VerifyProof_WhenTreeDepthIs1() external view {
        uint256 maxDepth = 1;
        bytes memory honkProof = vm.readFileBinary("../semaphore/target/proof-clean-depth1");
        console.logBytes(honkProof);
        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier
        assertTrue(semaphoreHonkVerifier.verify(honkProof, publicInputs, maxDepth));
    }

    // when logN = 15
    function test_VerifyProof_WhenTreeDepthIs8() external view {
        uint256 maxDepth = 8;
        bytes memory honkProof =
            vm.readFileBinary(string.concat("../semaphore/target/proof-clean-depth", vm.toString(maxDepth)));
        console.logBytes(honkProof);
        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier
        assertTrue(semaphoreHonkVerifier.verify(honkProof, publicInputs, maxDepth));
    }

    // when logN = 16
    function test_VerifyProof_WhenTreeDepthIs16() external view {
        uint256 maxDepth = 16;
        bytes memory honkProof = vm.readFileBinary("../semaphore/target/proof-clean-depth16");
        console.logBytes(honkProof);
        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier
        assertTrue(semaphoreHonkVerifier.verify(honkProof, publicInputs, maxDepth));
    }

    // when logN = 17
    function test_VerifyProof_WhenTreeDepthIs32() external view {
        uint256 maxDepth = 32;
        bytes memory honkProof = vm.readFileBinary("../semaphore/target/proof-clean-depth32");
        console.log("honkProof.length", honkProof.length); // 14176
        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier

        assertTrue(semaphoreHonkVerifier.verify(honkProof, publicInputs, maxDepth));
    }
}
