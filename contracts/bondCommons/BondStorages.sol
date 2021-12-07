//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;

/**
 * @dev - This is a smart contract that bond-related structs and storages are defined.
 */ 
contract BondStorages {

    ///--------------------------------
    /// Storages
    ///--------------------------------

    // checkpoints for all JuniorBonds matureing at (timestamp) -> (JuniorBondsAt)
    // timestamp -> JuniorBondsAt
    mapping(uint256 => JuniorBondsAt) public juniorBondsMaturingAt;

    // metadata for senior bonds
    // bond id => bond (SeniorBond)
    mapping(uint256 => SeniorBond) public seniorBonds;

    // metadata for junior bonds
    // bond id => bond (JuniorBond)
    mapping(uint256 => JuniorBond) public juniorBonds;

    // pool state / average bond
    // holds rate of payment by juniors to seniors
    SeniorBond public abond;


    ///--------------------------------
    /// Structs
    ///--------------------------------

    // a senior BOND (metadata for NFT)
    struct SeniorBond {
        uint256 principal; // amount seniors put in
        uint256 gain;      // amount yielded at the end. total = principal + gain
        uint256 issuedAt;  // bond was issued at timestamp
        uint256 maturesAt; // bond matures at timestamp
        bool liquidated;   // was it liquidated yet
    }

    // a junior BOND (metadata for NFT)
    struct JuniorBond {
        uint256 tokens;    // amount of tokens (jTokens) junior put in
        uint256 maturesAt; // bond matures at timestamp
    }

    // a checkpoint for all JuniorBonds with same maturity date JuniorBond.maturesAt
    struct JuniorBondsAt {
        uint256 tokens;    // sum of JuniorBond.tokens for JuniorBonds with the same JuniorBond.maturesAt
        uint256 price;     // price at which JuniorBonds will be paid. Initially 0 -> unliquidated (price is in the future or not yet liquidated)
    }

}
