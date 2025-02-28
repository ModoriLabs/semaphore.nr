// SPDX-License-Identifier: Apache-2.0

pragma solidity 0.8.28;

abstract contract SemaphoreGroups {
    function _addMember(
        uint256 groupId,
        uint256 identityCommitment
    ) internal virtual returns (uint256 merkleTreeRoot) {
        // TODO: implement groupId
        // uint256 index = getMerkleTreeSize(groupId);
        // merkleTreeRoot = merkleTrees[groupId]._insert(identityCommitment);

        // emit MemberAdded(groupId, index, identityCommitment, merkleTreeRoot);
    }
}
