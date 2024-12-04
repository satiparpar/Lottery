// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";

/**
 * @title RaffleScript
 * @author satiparpar  (Mohammad H satari)
 * @notice This contract is an Script for Raffle contract
 */
contract RaffleScript is Script {
    Raffle public raffle;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        raffle = new Raffle(1);

        vm.stopBroadcast();
    }
}
