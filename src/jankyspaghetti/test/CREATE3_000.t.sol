// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "./utils/DSTestPlus.sol";
import {MockERC20JankySpaghetti000} from "./utils/mocks/MockERC20JankySpaghetti000.sol";

import {CREATE3} from "../utils/CREATE3.sol";

contract CREATE3_000_Test is DSTestPlus {
    function testDeployERC20JankySpaghetti() public {
        bytes32 salt = keccak256(bytes("A salt!"));

        MockERC20JankySpaghetti000 deployed = MockERC20JankySpaghetti000(
            CREATE3.deploy(
                salt,
                abi.encodePacked(
                    type(MockERC20JankySpaghetti000).creationCode,
                    abi.encode("Janky Spaghetti Token", "JANK", 18)
                )
            )
        );

        assertEq(address(deployed), CREATE3.getDeployed(salt));

        assertEq(deployed.name(), "Janky Spaghetti Token");
        assertEq(deployed.symbol(), "JANK");
        assertEq(deployed.decimals(), 18);
    }
}
