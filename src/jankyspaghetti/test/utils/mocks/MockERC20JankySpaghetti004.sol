// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {ERC20JankySpaghetti004} from "../../../tokens/ERC20JankySpaghetti004.sol";

contract MockERC20JankySpaghetti004 is ERC20JankySpaghetti004 {
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) ERC20JankySpaghetti004(_name, _symbol, _decimals) {}

    function mint(address to, uint256 value) public virtual {
        _mint_g8T(to, value);
    }

    function burn(address from, uint256 value) public virtual {
        _burn_vf7(from, value);
    }
}
