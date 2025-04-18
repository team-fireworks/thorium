--!strict

local types = require("../types")

type Private = {
	title: string?,
	placement: number,
	discordEmoji: string?,
	color: Color3?,
}

local private: types.Map<types.DifficultyBuilder, Private> = {}

local function titled(self: types.DifficultyBuilder, title: string)
	private[self].title = title
	return self
end

local function discordEmoji(self: types.DifficultyBuilder, discordEmoji: string)
	private[self].discordEmoji = discordEmoji
	return self
end

local function color(self: types.DifficultyBuilder, color: Color3)
	private[self].color = color
	return self
end

local function build(self: types.DifficultyBuilder): types.Difficulty
	local privateSelf = private[self]
	return table.freeze({
		type = "Difficulty" :: "Difficulty",
		title = privateSelf.title,
		placement = privateSelf.placement,
		discordEmoji = privateSelf.discordEmoji,
		color = privateSelf.color,
	})
end

local function new(placement: number)
	local self: types.DifficultyBuilder = {
		type = "DifficultyBuilder",
		titled = titled,
		discordEmoji = discordEmoji,
		color = color,
		build = build,
	}

	private[self] = {
		title = nil,
		placement = placement,
		discordEmoji = nil,
		color = nil,
	}

	return table.freeze(self)
end

local function buildFrom(difficulty: types.Difficulty)
	local self: types.DifficultyBuilder = {
		type = "DifficultyBuilder",
		titled = titled,
		discordEmoji = discordEmoji,
		color = color,
		build = build,
	}

	private[self] = {
		title = difficulty.title,
		placement = difficulty.placement,
		discordEmoji = difficulty.discordEmoji,
		color = difficulty.color,
	}

	return table.freeze(self)
end

return table.freeze({
	new = new,
	buildFrom = buildFrom,
})
