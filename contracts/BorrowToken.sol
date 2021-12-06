//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.6;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


/**
 * @dev - This is a ERC20 token that represent total repaid-amount of stablecoin borrowed
 */ 
contract BorrowToken is ERC20 {

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    )
        ERC20(name_, symbol_)
    {
        _setupDecimals(decimals_);
    }

}
