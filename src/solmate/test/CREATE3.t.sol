// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "./utils/DSTestPlus.sol";
import {MockERC20Solmate} from "./utils/mocks/MockERC20Solmate.sol";

import {CREATE3} from "../utils/CREATE3.sol";

contract CREATE3Test is DSTestPlus {
    function testDeployERC20Solmate() public {
        bytes32 salt = keccak256(bytes("A salt!"));

        MockERC20Solmate deployed = MockERC20Solmate(
            CREATE3.deploy(
                salt,
                abi.encodePacked(
                    type(MockERC20Solmate).creationCode,
                    abi.encode("Mock Token", "MOCK", 18)
                )
            )
        );

        assertEq(address(deployed), CREATE3.getDeployed(salt));

        assertEq(deployed.name(), "Mock Token");
        assertEq(deployed.symbol(), "MOCK");
        assertEq(deployed.decimals(), 18);
    }
}
