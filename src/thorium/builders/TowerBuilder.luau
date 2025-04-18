--!strict

local types = require("../types")

type Private = {
	towerType: types.TowerType,
	title: string?,
	name: string,
	abbreviate: boolean?,
	difficulty: types.Difficulty,
	difficultyPlacement: number,
	creators: { number },
	endings: { unknown },
}

local private: types.Map<types.TowerBuilder, Private> = {}

local function titled(self: types.TowerBuilder, title: string): types.TowerBuilder
	private[self].title = title
	return self
end

local function abbreviate(self: types.TowerBuilder, abbreviate: boolean): types.TowerBuilder
	private[self].abbreviate = abbreviate
	return self
end

local function creator(self: types.TowerBuilder, userId: number): types.TowerBuilder
	table.insert(private[self].creators, userId)
	return self
end

local function ending(self: types.TowerBuilder, ending: unknown): types.TowerBuilder
	error("not yet implemented")
end

local function build(self: types.TowerBuilder): types.Tower
	local privateSelf = private[self]
	local abbreviate = privateSelf.abbreviate
	return table.freeze({
		type = "Tower" :: "Tower",
		towerType = privateSelf.towerType,
		title = privateSelf.title or privateSelf.name,
		name = privateSelf.name,
		abbreviate = if abbreviate ~= nil then abbreviate else false,
		creators = privateSelf.creators,
		endings = privateSelf.endings,
		difficulty = privateSelf.difficulty,
		difficultyPlacement = privateSelf.difficultyPlacement,
	})
end

local function new(towerType: types.TowerType, name: string, difficulty: types.Difficulty, difficultyPlacement: number?)
	local self: types.TowerBuilder = {
		type = "TowerBuilder",
		titled = titled,
		abbreviate = abbreviate,
		creator = creator,
		ending = ending,
		build = build,
	}

	private[self] = {
		towerType = towerType,
		name = name,
		creators = {},
		endings = {},
		difficulty = difficulty,
		difficultyPlacement = difficultyPlacement or 0,
	}

	return self
end

return table.freeze({
	new = new,
})
