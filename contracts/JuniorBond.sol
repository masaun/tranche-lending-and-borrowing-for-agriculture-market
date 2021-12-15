//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import { IBond } from "./interfaces/IBond.sol";


/**
 * @dev - This is a smart contract for the Junior Bond
 */ 
contract JuniorBond is IBond, ERC721 {

    address public override tranchePool;

    constructor(
        address tranchePool_,
        string memory name_,
        string memory symbol_
    )
      ERC721(name_, symbol_)
    {
        tranchePool = tranchePool_;
    }

    function mint(address to_, uint256 tokenId_)
      public override
    {
        require(msg.sender == tranchePool, "JB: mint not tranchePool");
        _mint(to_, tokenId_);
    }

    function burn(uint256 tokenId_)
      public override
    {
        require(msg.sender == tranchePool, "JB: burn not tranchePool");
        _burn(tokenId_);
    }

}
