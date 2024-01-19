// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "forge-std/Test.sol";

import { MudTest } from "@latticexyz/world/test/MudTest.t.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { WorldResourceIdLib } from "@latticexyz/world/src/WorldResourceId.sol";
import { ROOT_NAMESPACE, ROOT_NAMESPACE_ID } from "@latticexyz/world/src/constants.sol";
import { RESOURCE_SYSTEM } from "@latticexyz/world/src/worldResourceTypes.sol";
import { NamespaceOwner } from "@latticexyz/world/src/codegen/tables/NamespaceOwner.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";

contract BaseTest is MudTest {
  IWorld world;
  uint256 userNonce = 0;

  address payable alice;
  address payable bob;
  address payable eve;

  function setUp() public override {
    super.setUp();
    world = IWorld(worldAddress);

    alice = getUser();
    bob = getUser();
    eve = getUser();
  }

  function getUser() internal returns (address payable) {
    address payable user = payable(address(uint160(uint256(keccak256(abi.encodePacked(userNonce++))))));
    vm.deal(user, 100 ether);
    return user;
  }

  modifier prank(address target) {
    vm.startPrank(target);
    _;
    vm.stopPrank();
  }

  modifier adminPrank() {
    vm.startPrank(NamespaceOwner.get(ROOT_NAMESPACE_ID));
    _;
    vm.stopPrank();
  }

  function prankAdmin() internal {
    vm.startPrank(NamespaceOwner.get(ROOT_NAMESPACE_ID));
  }
}
