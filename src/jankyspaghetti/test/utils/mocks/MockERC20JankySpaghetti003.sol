// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {ERC20JankySpaghetti003} from "../../../tokens/ERC20JankySpaghetti003.sol";

contract MockERC20JankySpaghetti003 is ERC20JankySpaghetti003 {
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) ERC20JankySpaghetti003(_name, _symbol, _decimals) {}

    function mint(address to, uint256 value) public virtual {
        _mint(to, value);
    }

    function burn(address from, uint256 value) public virtual {
        _burn(from, value);
    }
}
