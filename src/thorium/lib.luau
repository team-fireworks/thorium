local DifficultyBuilder = require("./builders/DifficultyBuilder")
local DifficultyPlacement = require("./DifficultyPlacement")
local TowerTypeBuilder = require("./builders/TowerTypeBuilder")
local types = require("./types")

export type Difficulty = types.Difficulty
export type DifficultyBuilder = types.DifficultyBuilder
export type Tower = types.Tower
export type TowerBuilder = types.TowerBuilder
export type TowerType = types.TowerType
export type TowerTypeBuilder = types.TowerTypeBuilder

local Thorium = table.freeze({
	version = "0.0.0-dev",

	DifficultyBuilder = DifficultyBuilder,
	DifficultyPlacement = DifficultyPlacement,
	TowerTypeBuilder = TowerTypeBuilder,
})

return Thorium
