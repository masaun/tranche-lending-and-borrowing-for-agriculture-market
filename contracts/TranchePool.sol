//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;


/**
 * @dev - This is a smart contract that manage pools of tranches (Pool of Senior Tranche / Junior Tranche)
 *        (Reference from the SmartYield.sol in the BarnBridge)
 * 
 * @dev - This smart contract is integrated with existing Lending Protocols in order to generate yield for allocating into 2 Pools (Senior/Junior).
 */ 
contract TranchePool {

    constructor() {}

    /**
     * @dev - Deposit stablecoins (e.g. DAI, USDC, USDT) into existing lending protocols (e.g. AAVE, Compound)
     * @dev - Generate yield through existing lending protocols (e.g. AAVE, Compound)
     */
    function deposit() public {
        // [Todo]: AAVE
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
