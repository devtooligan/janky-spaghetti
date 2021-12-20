// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {IERC20} from "../../../interfaces/IERC20.sol";
import {IERC2612} from "../../../interfaces/IERC2612.sol";

contract ERC20JankySpaghettiUser {
    address token;

    constructor(address _token) {
        token = _token;
    }

    function approve(address spender, uint256 amount) public virtual returns (bool) {
        return IERC20(token).approve(spender, amount);
    }

    function transfer(address to, uint256 amount) public virtual returns (bool) {
        return IERC20(token).transfer(to, amount);
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual returns (bool) {
        return IERC20(token).transferFrom(from, to, amount);
    }

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public virtual {
        return IERC2612(token).permit(owner, spender, value, deadline, v, r, s);
    }
}
