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


    /**
     * @dev - Deposit stablecoins (e.g. DAI, USDC, USDT) into existing lending protocols (e.g. AAVE, Compound)
     * @dev - Generate yield through existing lending protocols (e.g. AAVE, Compound)
     */
    function deposit() public {
        // [Todo]:
    }

    /**
     * @dev - Harvest yields that is generated via existing lending protocols (e.g. AAVE, Compound)
     */ 
    function harvestYieldGenerated() public {
        // [Todo]:
    }

    /**
     * @dev - Allocate yields generated into each pools of tranches (Senior tranche's pool / Junior tranche's pool)
     */ 
    function allocateYieldGenerated() public {
        // [Todo]:
    }

}
