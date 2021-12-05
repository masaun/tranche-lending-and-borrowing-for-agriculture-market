//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;

import { SafeMath } from "@openzeppelin/contracts/math/SafeMath.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { JuniorTrancheToken } from "./JuniorTrancheToken.sol";


/**
 * @dev - This is a smart contract that manage pools of tranches (Pool of Senior Tranche / Junior Tranche)
 *        (Same role with the SmartYield.sol in the BarnBridge)
 * 
 * @dev - This smart contract is integrated with existing Lending Protocols in order to generate yield for allocating into 2 Pools (Senior/Junior).
 */ 
contract TranchePool {

    // senior BOND tranche (NFT)
    address public seniorBondTranche; // IBond

    // junior BOND tranche (NFT)
    address public juniorBondTranche; // IBond

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) JuniorTrancheToken(name_, symbol_, decimals_) {
        // [Todo]:
    }

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

    /**
     * @dev - A farmer borrow specified-amount from this pool
     */
    function borrow() public {
        // [Todo]: 
    }

}
