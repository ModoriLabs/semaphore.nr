//SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../interfaces/ISemaphoreHonk.sol";

contract Feedback {
    ISemaphoreHonk public semaphore;

    uint256 public groupId;

    constructor(address semaphoreAddress) {
        semaphore = ISemaphoreHonk(semaphoreAddress);

        groupId = semaphore.createGroup();
    }

    function joinGroup(uint256 identityCommitment) external {
        semaphore.addMember(groupId, identityCommitment);
    }

    function sendFeedback(
        uint256 merkleTreeDepth,
        uint256 merkleTreeRoot,
        uint256 nullifier,
        uint256 feedback,
        bytes calldata _proof
    ) external {
        ISemaphoreHonk.SemaphoreHonkProof memory proof = ISemaphoreHonk.SemaphoreHonkProof(
            merkleTreeDepth,
            merkleTreeRoot,
            nullifier,
            feedback,
            groupId,
            _proof
        );

        semaphore.validateProof(groupId, proof);
    }
}
