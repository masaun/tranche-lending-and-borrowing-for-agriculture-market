//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;

/**
 * @dev - This is a smart contract that bond-related events are defined.
 */ 
contract BondEvents {

    // emitted when user buys junior ERC20 tokens
    event BuyTokens(address indexed buyer, uint256 underlyingIn, uint256 tokensOut, uint256 fee);
    // emitted when user sells junior ERC20 tokens and forfeits their share of the debt
    event SellTokens(address indexed seller, uint256 tokensIn, uint256 underlyingOut, uint256 forfeits);

    event BuySeniorBond(address indexed buyer, uint256 indexed seniorBondId, uint256 underlyingIn, uint256 gain, uint256 forDays);

    event RedeemSeniorBond(address indexed owner, uint256 indexed seniorBondId, uint256 fee);

    event BuyJuniorBond(address indexed buyer, uint256 indexed juniorBondId, uint256 tokensIn, uint256 maturesAt);

    event RedeemJuniorBond(address indexed owner, uint256 indexed juniorBondId, uint256 underlyingOut);

}
