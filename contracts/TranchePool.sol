//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

//import "hardhat/console.sol";


/**
 * @dev - This is a smart contract that manage pools of tranches (Pool of Senior Tranche / Junior Tranche)
 *        (Reference from the SmartYield.sol in the BarnBridge)
 * 
 * @dev - This smart contract is integrated with existing Lending Protocols in order to generate yield for allocating into 2 Pools (Senior/Junior).
 */ 
contract TranchePool {

    constructor(string memory _testMessage) {
        console.log("Test: ", _testMessage);
    }

}
