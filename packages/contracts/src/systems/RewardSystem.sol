// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;
import { System } from "@latticexyz/world/src/System.sol";
import { GameConfig } from "../codegen/index.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract RewardSystem is System {
  function reward() public {
    uint256 rewardAmount = 1000;
    IERC20 token = IERC20(GameConfig.getTokenAddress());
    token.transfer(_msgSender(), rewardAmount);
  }
}
