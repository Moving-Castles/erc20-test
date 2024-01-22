// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.21;
import { IWorld } from "../../src/codegen/world/IWorld.sol";

import { BaseTest } from "../BaseTest.sol";

import "../../src/codegen/index.sol";
import "../../src/libraries/Libraries.sol";

contract SpawnSystemTest is BaseTest {
  function testIncrement() public {
    setUp();

    vm.startPrank(alice);
    bytes32 playerEntity = world.spawn("alice");
    world.increment();
    vm.stopPrank();

    assertEq(Counter.get(playerEntity), gameConfig.increment);
  }
}
