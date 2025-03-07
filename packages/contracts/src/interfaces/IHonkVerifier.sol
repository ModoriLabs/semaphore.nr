//SPDX-License-Identifier: MIT
pragma solidity >=0.8.23 <=0.8.28;

interface IHonkVerifier {
    function verify(bytes calldata _proof, bytes32[] calldata _publicInputs, uint256 _treeDepth) external view returns (bool);
}
