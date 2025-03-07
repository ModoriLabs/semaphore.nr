// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {HonkVerifier, BaseHonkVerifier} from "../src/base/HonkVerifier.sol";
import {HonkVerificationKeys} from "../src/base/HonkVerificationKeys.sol";
import {SemaphoreHonkVerifier} from "../src/base/SemaphoreHonkVerifier.sol";
import {IHonkVerifier} from "../src/interfaces/IHonkVerifier.sol";
import {SemaphoreHonk} from "../src/SemaphoreHonk.sol";
import {ISemaphoreHonk} from "../src/interfaces/ISemaphoreHonk.sol";

contract SemaphoreHonkTest is Test {
    SemaphoreHonkVerifier public honkVerifier;
    HonkVerificationKeys public verificationKeys;
    SemaphoreHonk public semaphore;

    function setUp() public {
        verificationKeys = new HonkVerificationKeys();
        honkVerifier = new SemaphoreHonkVerifier(address(verificationKeys));
        semaphore = new SemaphoreHonk(IHonkVerifier(address(honkVerifier)));
    }

    function test_CreateGroup() public {
        semaphore.createGroup();
    }

    function test_RevertWhen_ValidateProof_WithDifferentMessage() public {
        uint256 groupId = semaphore.createGroup();
        uint256[] memory identityCommitments = new uint256[](3);
        identityCommitments[0] = 5407869850562333726769604095330004527418297248703115046359956082084347839061;
        identityCommitments[1] = 18699903263915756199535533399390350858126023699350081471896734858638858200219;
        identityCommitments[2] = 4446973358529698253939037684201229393105675634248270727935122282482202195132;
        for (uint256 i = 0; i < identityCommitments.length; i++) {
            semaphore.addMember(groupId, identityCommitments[i]);
        }

        bytes memory proof = vm.readFileBinary(
            "../semaphore/target/proof-clean2"
        );

        uint256 actualMessage = 2;
        ISemaphoreHonk.SemaphoreHonkProof memory honkProof = ISemaphoreHonk.SemaphoreHonkProof({
            merkleTreeDepth: 32,
            merkleTreeRoot: 0x265aad7d885c5a4d4bece302f04ac298982800c85490983594290ef693fcaf55,
            nullifier:      0x15fc910d3c6dc6bf2362c2c1c15a8bebef733c5f6d4e1b2143e59cf9daaee6e9,
            proof: proof,
            message: actualMessage + 100,
            scope: 0
        });

        vm.expectRevert(abi.encodeWithSelector(BaseHonkVerifier.SumcheckFailed.selector));
        semaphore.validateProof(groupId, honkProof);
    }

    function test_ValidateProof() public {
        uint256 groupId = semaphore.createGroup();
        uint256[] memory identityCommitments = new uint256[](3);
        identityCommitments[0] = 5407869850562333726769604095330004527418297248703115046359956082084347839061;
        identityCommitments[1] = 18699903263915756199535533399390350858126023699350081471896734858638858200219;
        identityCommitments[2] = 4446973358529698253939037684201229393105675634248270727935122282482202195132;
        for (uint256 i = 0; i < identityCommitments.length; i++) {
            semaphore.addMember(groupId, identityCommitments[i]);
        }

        bytes memory proof = vm.readFileBinary(
            "../semaphore/target/proof-clean2"
        );

        ISemaphoreHonk.SemaphoreHonkProof memory honkProof = ISemaphoreHonk.SemaphoreHonkProof({
            merkleTreeDepth: 32,
            merkleTreeRoot: 0x265aad7d885c5a4d4bece302f04ac298982800c85490983594290ef693fcaf55,
            nullifier:      0x15fc910d3c6dc6bf2362c2c1c15a8bebef733c5f6d4e1b2143e59cf9daaee6e9,
            proof: proof,
            message: 2,
            scope: 0
        });

        semaphore.validateProof(groupId, honkProof);
    }

    function _hash(uint256 message) private pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(message))) >> 8;
    }
}
