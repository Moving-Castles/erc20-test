import { addToSequencer } from "./actionSequencer"

export enum WorldFunctions {
  Spawn = "spawn",
  Increment = "increment",
  Reward = "reward",
}

// --- API --------------------------------------------------------------

export function spawn(name: string) {
  return addToSequencer(WorldFunctions.Spawn, [name])
}

export function increment() {
  return addToSequencer(WorldFunctions.Increment, [])
}

export function reward() {
  return addToSequencer(WorldFunctions.Reward, [])
}