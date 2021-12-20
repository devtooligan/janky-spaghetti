// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {ERC20JankySpaghetti001} from "../../../tokens/ERC20JankySpaghetti001.sol";

contract MockERC20JankySpaghetti001 is ERC20JankySpaghetti001 {

    function name() public pure override returns (string memory) {
        return "Janky Spaghetti Token";
    }

    function symbol() external pure override returns (string memory) {
        return "JANK";
    }
    function decimals() external pure override returns (uint8) {
        return 18;
    }
    function mint(address to, uint256 value) public virtual {
        _mint(to, value);
    }

    function burn(address from, uint256 value) public virtual {
        _burn(from, value);
    }
}
