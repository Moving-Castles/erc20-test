// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.21;
import { IWorld } from "../../src/codegen/world/IWorld.sol";

import { BaseTest } from "../BaseTest.sol";

import "../../src/codegen/index.sol";
import "../../src/libraries/Libraries.sol";

contract SpawnSystemTest is BaseTest {
  function testSpawn() public {
    setUp();

    vm.startPrank(alice);
    bytes32 playerEntity = world.spawn("alice");
    vm.stopPrank();

    assertEq(Name.get(playerEntity), "alice");
    assertEq(Counter.get(playerEntity), 0);
  }

  function testRevertNoName() public {
    setUp();

    vm.startPrank(alice);
    vm.expectRevert("no name");
    world.spawn("");
    vm.stopPrank();
  }
}
