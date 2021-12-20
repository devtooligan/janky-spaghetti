// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {ERC20JankySpaghettiFinal} from "../../../tokens/ERC20JankySpaghettiFinal.sol";

contract MockERC20JankySpaghettiFinal is ERC20JankySpaghettiFinal {

    constructor() payable {}
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
        _mint_g8T(to, value);
    }

    function burn(address from, uint256 value) public virtual {
        _burn_vf7(from, value);
    }
}
