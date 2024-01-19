// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

import { IBaseWorld } from "@latticexyz/world/src/codegen/interfaces/IBaseWorld.sol";

import { IIncrementSystem } from "./IIncrementSystem.sol";
import { IInitSystem } from "./IInitSystem.sol";
import { IRewardSystem } from "./IRewardSystem.sol";
import { ISpawnSystem } from "./ISpawnSystem.sol";

/**
 * @title IWorld
 * @notice This interface integrates all systems and associated function selectors
 * that are dynamically registered in the World during deployment.
 * @dev This is an autogenerated file; do not edit manually.
 */
interface IWorld is IBaseWorld, IIncrementSystem, IInitSystem, IRewardSystem, ISpawnSystem {

}
