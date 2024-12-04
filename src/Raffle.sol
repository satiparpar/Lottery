// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title a sample Raffle contract
 * @author satiparpar  (Mohammad H satari)
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    uint256 private immutable i_entrancePrice;

    constructor(uint256 entrancePrice) {
        i_entrancePrice = entrancePrice;
    }

    function enterRaffle() public payable {}

    function pickWinner() public {}

    /**
     * Getter Functions
     */
    function getEntranceFee() external view returns (uint256) {
        return i_entrancePrice;
    }
}
