//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import { IBond } from "./interfaces/IBond.sol";


/**
 * @dev - This is a smart contract for the Senior Bond
 */ 
contract SeniorBond is IBond, ERC721 {

    address public override tranchePool;
    //address public override smartYield;

    constructor(
        address tranchePool_,
        //address smartYield_,
        string memory name_,
        string memory symbol_
    ) ERC721(name_, symbol_) {
        tranchePool = tranchePool_;
        //smartYield = smartYield_;
    }

    function mint(address to_, uint256 tokenId_) public override {
        require(msg.sender == tranchePool, "SB: mint not tranchePool");
        //require(msg.sender == smartYield, "SB: mint not smartYield");
        _mint(to_, tokenId_);
    }

    function burn(uint256 tokenId_) public override {
        require(msg.sender == tranchePool, "SB: burn not tranchePool");
        //require(msg.sender == smartYield, "SB: burn not smartYield");
        _burn(tokenId_);
    }

}
