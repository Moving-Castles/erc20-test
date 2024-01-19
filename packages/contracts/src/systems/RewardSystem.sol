// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;
import { System } from "@latticexyz/world/src/System.sol";
import { IBaseWorld } from "@latticexyz/world/src/codegen/interfaces/IBaseWorld.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { Puppet } from "@latticexyz/world-modules/src/modules/puppet/Puppet.sol";

import { GameConfig } from "../codegen/index.sol";
import { LibUtils } from "../libraries/Libraries.sol";

contract RewardSystem is System {
  function reward() public {
    address token = GameConfig.getTokenAddress();

    address worldAddress = StoreSwitch.getStoreAddress();

    ResourceId systemId = Puppet(token).systemId();

    address sender = _msgSender();

    uint256 rewardAmount = 1000;

    bytes memory callDataTransfer = abi.encodeCall(IERC20.transfer, (sender, rewardAmount));

    bytes memory callDataDelegateCall = abi.encodeCall(IBaseWorld(worldAddress).call, (systemId, callDataTransfer));

    (bool success, ) = worldAddress.delegatecall(callDataDelegateCall);

    require(success, "token transfer failed");
  }
}
