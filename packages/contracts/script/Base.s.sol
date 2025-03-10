// SPDX-License-Identifier: MIT
pragma solidity >=0.8.25 <0.9.0;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";

abstract contract BaseScript is Script {
    /// @dev Included to enable compilation of the script without a $MNEMONIC environment variable.
    // string internal constant TEST_MNEMONIC = "test test test test test test test test test test test junk";
    uint256 internal PRIVATE_KEY;
    string internal networkName;

    /// @dev Needed for the deterministic deployments.
    bytes32 internal constant ZERO_SALT = bytes32(0);

    /// @dev The address of the transaction broadcaster.
    address internal broadcaster;

    /// @dev Used to derive the broadcaster's address if $ETH_FROM is not defined.
    string internal mnemonic;

    /// @dev Initializes the transaction broadcaster like this:
    ///
    /// - If $ETH_FROM is defined, use it.
    /// - Otherwise, derive the broadcaster address from $MNEMONIC.
    /// - If $MNEMONIC is not defined, default to a test mnemonic.
    ///
    /// The use case for $ETH_FROM is to specify the broadcaster key and its address via the command line.
    constructor() {
        PRIVATE_KEY = vm.envOr("TESTNET_PRIVATE_KEY", uint256(1));
        broadcaster = vm.rememberKey(PRIVATE_KEY);
        console.log("Broadcaster: ", broadcaster);

        networkName = vm.envString("NETWORK");
        console.log("Network: ", networkName);
        string memory rpcUrl = vm.envString("TEST_RPC_URL");
        console.log("RPC URL: ", rpcUrl);
    }

    function parseAddress(string memory contractName) internal view returns(address payable contractAddress) {
        string memory path = string.concat(string.concat("./deployments/", networkName, "/"), contractName, ".json");
        string memory json = vm.readFile(path);
        bytes memory positionRouterAddressBytes = vm.parseJson(json, ".address");
        console.log("Contract: ", contractName);
        console.logBytes(positionRouterAddressBytes);
        contractAddress = abi.decode(positionRouterAddressBytes, (address));
    }

    function _writeDeployment(string memory contractName, address contractAddress) internal {
        string memory filePath = _getDeploymentPath(contractName);
        string memory jsonContent = string(
            abi.encodePacked(
                '{"address": "',
                contractAddress,
                '"}'
            )
        );
        vm.writeJson(jsonContent, filePath);
    }

    function _getDeploymentPath(string memory contractName) internal view returns (string memory) {
        return string.concat(string.concat("./deployments/", networkName, "/"), contractName, ".json");
    }

    modifier broadcast() {
        vm.startBroadcast(broadcaster);
        _;
        vm.stopBroadcast();
    }
}
