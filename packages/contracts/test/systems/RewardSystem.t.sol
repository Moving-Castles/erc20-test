// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.21;
import "forge-std/console.sol";
import { IWorld } from "../../src/codegen/world/IWorld.sol";
import { MudTest } from "@latticexyz/world/test/MudTest.t.sol";
import "../../src/codegen/index.sol";
import "../../src/libraries/Libraries.sol";

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { WorldResourceIdInstance } from "@latticexyz/world/src/WorldResourceId.sol";

import { _balancesTableId } from "@latticexyz/world-modules/src/modules/erc20-puppet/utils.sol";
import { Balances } from "@latticexyz/world-modules/src/modules/tokens/tables/Balances.sol";
import { Puppet } from "@latticexyz/world-modules/src/modules/puppet/Puppet.sol";
import { IERC20Mintable } from "@latticexyz/world-modules/src/modules/erc20-puppet/IERC20Mintable.sol";

contract RewardSystemTest is MudTest {
  using WorldResourceIdInstance for ResourceId;

  IWorld world;
  GameConfigData gameConfig;
  address internal alice;
  address internal bob;

  function setUp() public override {
    super.setUp();
    world = IWorld(worldAddress);
    gameConfig = GameConfig.get();
    alice = address(111);
    bob = address(222);
  }

  function testReward() public {
    address token = gameConfig.tokenAddress;
    ResourceId systemId = Puppet(token).systemId();
    ResourceId tableId = _balancesTableId(systemId.getNamespace());

    assertEq(Balances.get(tableId, worldAddress), 1000000);

    vm.startPrank(alice);
    world.reward();
    vm.stopPrank();

    assertEq(Balances.get(tableId, worldAddress), 999000);
  }
}
