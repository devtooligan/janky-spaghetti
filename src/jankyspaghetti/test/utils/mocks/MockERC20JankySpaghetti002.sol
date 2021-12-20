// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {ERC20JankySpaghetti002} from "../../../tokens/ERC20JankySpaghetti002.sol";

contract MockERC20JankySpaghetti002 is ERC20JankySpaghetti002 {
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) payable ERC20JankySpaghetti002(_name, _symbol, _decimals) {}

    function mint(address to, uint256 value) public virtual {
        _mint(to, value);
    }

    function burn(address from, uint256 value) public virtual {
        _burn(from, value);
    }
}
