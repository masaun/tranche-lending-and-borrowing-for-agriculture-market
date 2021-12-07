//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;

import { SafeMath } from "@openzeppelin/contracts/math/SafeMath.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { JuniorToken } from "./JuniorToken.sol";
import { BorrowToken } from "./BorrowToken.sol";

import { BondStorages } from "./bondCommons/BondStorages.sol";
import { BondEvents } from "./bondCommons/BondEvents.sol";

import { ILendingPool } from "./yield-sources/aave-v2/ILendingPool.sol";


/**
 * @dev - This is a smart contract that manage pools of tranches (Pool of Senior Tranche / Junior Tranche)
 *        (Same role with the SmartYield.sol in the BarnBridge)
 * 
 * @dev - This smart contract is integrated with existing Lending Protocols in order to generate yield for allocating into 2 Pools (Senior/Junior).
 */ 
contract TranchePool is JuniorToken, BondStorages, BondEvents {

    using SafeMath for uint256;

    uint256 public constant MAX_UINT256 = uint256(-1);
    uint256 public constant EXP_SCALE = 1e18;

    // controller address
    address public override controller;

    // address of IProviderPool
    address public pool;

    // senior BOND (NFT)
    address public seniorBond; // IBond

    // junior BOND (NFT)
    address public juniorBond; // IBond

    // latest SeniorBond Id
    uint256 public seniorBondId;

    // latest JuniorBond Id
    uint256 public juniorBondId;

    // underlying amount in matured and liquidated juniorBonds
    uint256 public underlyingLiquidatedJuniors;

    // tokens amount in unmatured juniorBonds or matured and unliquidated
    uint256 public tokensInJuniorBonds;

    // last index of juniorBondsMaturities that was liquidated
    uint256 public juniorBondsMaturitiesPrev;
    // list of junior bond maturities (timestamps)
    uint256[] public juniorBondsMaturities;




    // This is token that represent amount that should be repaid when maturity.
    BorrowToken public borrowToken;

    // AAVE-v2 Lending Pool
    ILendingPool public lendingPool;


    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        ILendingPool lendingPool_
    ) JuniorToken(name_, symbol_, decimals_) {
        lendingPool = lendingPool_;
    }

    /**
     * @dev - A lender deposit (=lend) stablecoins (e.g. DAI, USDC, USDT) into existing lending protocols (e.g. AAVE, Compound)
     * @dev - Yield is generated through existing lending protocols (e.g. AAVE, Compound)
     */
    function deposit(address asset, uint amount, address onBehalfOf, uint16 referralCode) public {
        //@dev - Create stablecoin instance (asset deposited are DAI, USDC, USDT, etc
        IERC20 stablecoin = IERC20(asset);

        //@notice - In advance, a user must approve "amount" 
        stablecoin.transferFrom(msg.sender, address(this), amount);

        //@dev - Deposit amount of tokens into AAVE's lending pool
        address onBehalfOf = address(0);
        uint16 referralCode = 0;
        lendingPool.deposit(asset, amount, onBehalfOf, referralCode);
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
     * @dev - Borrowing rate is the fixed-rate (that is determined by the period specified)
     */
    function borrow(address asset, uint principleBorrowingAmount, uint periodOfMaturity) public {
        address farmer = msg.sender;

        // [Todo]: @dev - Calculate repaid-amount based on fixed-rate and the period of maturity. Then, a farmer receive equal amount (that will be repaid when maturity) of brTokens.
        uint fixedRateToBorrow = 0;  // [Todo]: Replace with property value 
        uint interestAmountRepaid = principleBorrowingAmount * fixedRateToBorrow * periodOfMaturity;
        uint totalAmountRepaid = principleBorrowingAmount + interestAmountRepaid;
        borrowToken.transfer(farmer, totalAmountRepaid);

        // @dev - Amount of borrowing token is transferred into a farmer's wallet
        IERC20 stablecoin = IERC20(asset);
        stablecoin.transfer(farmer, totalAmountRepaid);
    }



    ///-------------------------------------------------------
    /// Reference from the SmartYield.sol
    ///-------------------------------------------------------


}
