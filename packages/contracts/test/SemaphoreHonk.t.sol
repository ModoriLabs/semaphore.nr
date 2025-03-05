// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {HonkVerifier} from "../src/base/HonkVerifier.sol";
import {IHonkVerifier} from "../src/interfaces/IHonkVerifier.sol";
import {SemaphoreHonk} from "../src/SemaphoreHonk.sol";
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
}
