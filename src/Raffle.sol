// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title a sample Raffle contract
 * @author satiparpar  (Mohammad H satari)
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    /* Errors */
    error Raffle__SendMoreToEnterRaffel();

    uint256 private immutable i_entrancePrice;
    // @dev The duration of lottery in seconds
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStampe;
    address payable[] public s_players;

    /* Events */
    event RaffleEnterd(address indexed player);

    constructor(uint256 entrancePrice, uint256 interval) {
        i_entrancePrice = entrancePrice;
        i_interval = interval;
        s_lastTimeStampe = block.timestamp;
    }

    /**
     * Getter Functions
     */
    function getEntranceFee() external view returns (uint256) {
        return i_entrancePrice;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entrancePrice) {
            revert Raffle__SendMoreToEnterRaffel();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEnterd(msg.sender);
    }

    function pickWinner() external {
        if ((block.timestamp - s_lastTimeStampe) < i_interval) {
            revert();
        }
    }
}
