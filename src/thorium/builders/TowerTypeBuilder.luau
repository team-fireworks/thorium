--!strict

local types = require("../types")
local TowerBuilder = require("./TowerBuilder")

type Private = {
	title: string,
	pointsAwarded: number,
}

local private: types.Map<types.TowerTypeBuilder, Private> = {}

local function pointsAwarded(self: types.TowerTypeBuilder, pointsAwarded: number): types.TowerTypeBuilder
	private[self].pointsAwarded = pointsAwarded
	return self
end

local function tower(
	self: types.TowerType,
	name: string,
	difficulty: types.Difficulty,
	difficultyPlacement: number?
): types.TowerBuilder
	return TowerBuilder.new(self, name, difficulty, difficultyPlacement)
end

local function build(self: types.TowerTypeBuilder): types.TowerType
	local privateSelf = private[self]
	return table.freeze({
		type = "TowerType" :: "TowerType",
		title = privateSelf.title,
		pointsAwarded = privateSelf.pointsAwarded,
		tower = tower,
	})
end

local function new(title: string): types.TowerTypeBuilder
	local self: types.TowerTypeBuilder = {
		type = "TowerTypeBuilder",
		pointsAwarded = pointsAwarded,
		title = title,
		build = build,
	}

	table.freeze(self)

	local privateData = {
		title = title,
		pointsAwarded = 0,
	}

	private[self] = privateData
	return self
end

return table.freeze({
	new = new,
})
