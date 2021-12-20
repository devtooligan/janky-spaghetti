// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "./utils/DSTestPlus.sol";
import {DSInvariantTest} from "./utils/DSInvariantTest.sol";

import {MockERC20Solmate} from "./utils/mocks/MockERC20Solmate.sol";
import {ERC20SolmateUser} from "./utils/users/ERC20SolmateUser.sol";

contract ERC20SolmateTest is DSTestPlus {
    MockERC20Solmate token;
    address user;

    function setUp() public {
        token = new MockERC20Solmate("Token", "TKN", 18);
        user = address(new ERC20SolmateUser(token));
    }

    function testGetSymbol() public {
        string memory symbol = token.symbol();
        assertEq(symbol, "TKN");
    }

    function testGetDecimals() public {
        uint8 decimals = token.decimals();
        assertEq(decimals, 18);
    }

    function testGetName() public {
        string memory name = token.name();
        assertEq(name, "Token");
    }

    function testMint() public {
        uint256 amount = 10 * 10**18;
        token.mint(user, amount);

        assertEq(token.totalSupply(), amount);
        assertEq(token.balanceOf(user), amount);
    }

    function testSeparator() public view {
        token.computeDomainSeparator();
    }


    function testBurn() public {
        uint256 mintAmount = 50 * 10**18;
        uint256 burnAmount = 10 * 10**18;

        token.mint(user, mintAmount);
        token.burn(user, burnAmount);

        assertEq(token.totalSupply(), mintAmount - burnAmount);
        assertEq(token.balanceOf(user), mintAmount - burnAmount);
    }

    function testApprove() public {
        uint256 amount = 50 * 10**18;
        assertTrue(token.approve(user, amount));

        assertEq(token.allowance(address(this), user), amount);
    }

    function testTransfer() public {
        uint256 amount = 50 * 10**18;
        token.mint(address(this), amount);

        assertTrue(token.transfer(user, amount));
        assertEq(token.totalSupply(), amount);

        if (address(this) == user) {
            assertEq(token.balanceOf(address(this)), amount);
        } else {
            assertEq(token.balanceOf(address(this)), 0);
            assertEq(token.balanceOf(user), amount);
        }
    }

    function testTransferFrom() public {
        uint256 approval = 50 * 10**18;
        uint256 amount = 50 * 10**18;
        address to = address(new ERC20SolmateUser(token));

        token.mint(address(user), amount);

        ERC20SolmateUser(user).approve(address(this), approval);

        assertTrue(token.transferFrom(address(user), to, amount));
        assertEq(token.totalSupply(), amount);

        uint256 app = address(user) == address(this) ||
            approval == type(uint256).max
            ? approval
            : approval - amount;
        assertEq(token.allowance(address(user), address(this)), app);

        if (address(user) == to) {
            assertEq(token.balanceOf(address(user)), amount);
        } else {
            assertEq(token.balanceOf(address(user)), 0);
            assertEq(token.balanceOf(to), amount);
        }
    }
}
