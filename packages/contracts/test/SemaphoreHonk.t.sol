// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {HonkVerifier} from "../src/base/HonkVerifier.sol";
import {IHonkVerifier} from "../src/interfaces/IHonkVerifier.sol";
import {SemaphoreHonk} from "../src/SemaphoreHonk.sol";
import {ISemaphoreHonk} from "../src/interfaces/ISemaphoreHonk.sol";

contract SemaphoreHonkTest is Test {
    HonkVerifier public honkVerifier;
    SemaphoreHonk public semaphore;

    function setUp() public {
        honkVerifier = new HonkVerifier();
        semaphore = new SemaphoreHonk(IHonkVerifier(address(honkVerifier)));
    }

    function test_CreateGroup() public {
        semaphore.createGroup();
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

        bytes memory honkProof = vm.readFileBinary(
            "../semaphore/target/proof-clean2"
        );

        console.log(_hash(2));
        console.log(_hash(0));

        // TODO: message, and scope should be _hash
        ISemaphoreHonk.SemaphoreHonkProof memory proof = ISemaphoreHonk.SemaphoreHonkProof({
            merkleTreeDepth: 32,
            merkleTreeRoot: 0x265aad7d885c5a4d4bece302f04ac298982800c85490983594290ef693fcaf55,
            nullifier: 0x2b6ae7250aa96afee81cb0ed558d267e6d4f3d5355e9b8fbc2c3e0192f0a872a,
            proof: honkProof,
            message: _hash(2),
            scope: _hash(0)
        });

        semaphore.validateProof(groupId, proof);
    }

    function _hash(uint256 message) private pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(message))) >> 8;
    }
}
