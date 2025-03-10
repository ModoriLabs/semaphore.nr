// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {UltraVerifier} from "../src/base/UltraVerifier32.sol";

contract UltraVerifierTest is Test {
    UltraVerifier public ultraVerifier;

    function setUp() public {
        ultraVerifier = new UltraVerifier();
    }

    function test_VerifyProof() external {
        bytes memory proof =
            vm.readFileBinary(string.concat("../semaphore/target/proof-clean-ultra-depth32"));

        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier

        assertTrue(ultraVerifier.verify(proof, publicInputs));
    }

    function test_VerifyProof_WithDifferentPublicInputs() external {
        bytes memory proof =
            vm.readFileBinary(string.concat("../semaphore/target/proof-clean-ultra-depth32"));

        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000002"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"2d709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"17a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier

        bytes4 PAIRING_FAILED_SELECTOR = bytes4(0xd71fd263);
        vm.expectRevert(abi.encodeWithSelector(PAIRING_FAILED_SELECTOR));
        ultraVerifier.verify(proof, publicInputs);
    }

    function test_VerifyInvalidProof_ShouldFail() external {
        bytes memory invalidProof =
            vm.readFileBinary(string.concat("../semaphore/target/proof-clean-ultra-depth32"));
        invalidProof[0] = bytes1(0xff);

        bytes32[] memory publicInputs = new bytes32[](4);
        publicInputs[0] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // message
        publicInputs[1] = hex"0000000000000000000000000000000000000000000000000000000000000001"; // scope
        publicInputs[2] = hex"1c709df0fc4393283665d98bd1f73a461a6a74f57c45ece9c192a88a389f8fd9"; // root
        publicInputs[3] = hex"07a76f71ef648dd62cdea92af5fe42fe84ef256a22d5f292b6381d1265fa7f89"; // nullifier

        bytes4 POINT_NOT_ON_CURVE_SELECTOR = bytes4(0xa3dad654);
        vm.expectRevert(abi.encodeWithSelector(POINT_NOT_ON_CURVE_SELECTOR));
        ultraVerifier.verify(invalidProof, publicInputs);
    }
}
