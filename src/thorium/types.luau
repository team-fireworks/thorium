export type Map<K, V> = { [K]: V }

export type DifficultyBuilder = {
	type: "DifficultyBuilder",
	titled: (self: DifficultyBuilder, title: string) -> DifficultyBuilder,
	discordEmoji: (self: DifficultyBuilder, discordEmoji: string) -> DifficultyBuilder,
	color: (self: DifficultyBuilder, color: Color3) -> DifficultyBuilder,
	build: (self: DifficultyBuilder) -> Difficulty,
}

export type Difficulty = {
	type: "Difficulty",
	title: string?,
	placement: number,
	discordEmoji: string?,
	color: Color3?,
}

export type TowerBuilder = {
	type: "TowerBuilder",
	titled: (self: TowerBuilder, title: string) -> TowerBuilder,
	abbreviate: (self: TowerBuilder, abbreviate: boolean) -> TowerBuilder,
	creator: (self: TowerBuilder, userId: number) -> TowerBuilder,
	ending: (self: TowerBuilder, ending: unknown) -> TowerBuilder,
	build: (self: TowerBuilder) -> Tower,
}

export type Tower = {
	type: "Tower",
	towerType: TowerType,
	title: string,
	name: string,
	abbreviate: boolean,
	difficulty: Difficulty,
	difficultyPlacement: number,
	creators: { number },
	endings: { unknown },
}

export type TowerTypeBuilder = {
	type: "TowerTypeBuilder",
	pointsAwarded: (self: TowerTypeBuilder, pointsAwarded: number) -> TowerTypeBuilder,
	build: (self: TowerTypeBuilder) -> TowerType,
}

export type TowerType = {
	type: "TowerType",
	tower: (
		self: TowerType,
		name: string,
		difficulty: Difficulty,
		difficultyPlacement: number?
	) -> TowerBuilder,
}

return nil

--
-- declare namespace Thorium {

-- 	export class AreaBuilder {
-- 		static readonly type: "AreaBuilder";
-- 		constructor(name: string);

-- 		titled(title: string): AreaBuilder;
-- 		num(num: number): AreaBuilder;
-- 		requirements(requirements: unknown[]): AreaBuilder;
-- 		tower(tower: Tower): AreaBuilder;
-- 		build(): Area;
-- 	}

-- 	export interface Area {
-- 		readonly type: "Area";
-- 	}

-- 	export class WorldBuilder {
-- 		static readonly type: "WorldBuilder";
-- 		constructor(name: string);

-- 		titled(title: string): WorldBuilder;
-- 		areaNoun(singular: string, plural: string): WorldBuilder;
-- 		area(area: Area): WorldBuilder;
-- 		build(): World;
-- 	}

-- 	export interface World {
-- 		readonly type: "World";
-- 	}

-- 	abstract class AnnouncerBuilder {
-- 		announceDifficultiesAbove(difficulty: Difficulty): AnnouncerBuilder;
-- 		announceOnlyDifficulty(difficulty: Difficulty): AnnouncerBuilder;
-- 		announceDifficultiesBelow(difficulty: Difficulty): AnnouncerBuilder;
-- 		build(): Announcer;
-- 	}

-- 	export class DiscordAnnouncerBuilder extends AnnouncerBuilder {
-- 		static readonly type: "DiscordAnnouncerBuilder";

-- 		webhook(webhook: string): DiscordAnnouncerBuilder;
-- 		format(content: string): DiscordAnnouncerBuilder;
-- 	}

-- 	export class ChatAnnouncerBuilder extends AnnouncerBuilder {
-- 		static readonly type: "ChatAnnouncerBuilder";
-- 		format(content: string): DiscordAnnouncerBuilder;
-- 	}

-- 	export class GlobalChatAnnouncerBuilder extends AnnouncerBuilder {
-- 		static readonly type: "GlobalChatAnnouncerBuilder";
-- 		format(content: string): DiscordAnnouncerBuilder;
-- 	}

-- 	export interface Announcer {
-- 		readonly type: "Announcer";
-- 	}

-- 	export class GameBuilder {
-- 		static readonly type: "GameBuilder";
-- 		titled(title: string): GameBuilder;
-- 		announcer(announcer: Announcer): GameBuilder;
-- 		difficulty(difficulty: Difficulty): GameBuilder;
-- 		towerType(towerType: TowerType): GameBuilder;
-- 		architecture(architecture: Architecture): GameBuilder;
-- 		world(world: World): GameBuilder;
-- 		build(): Game;
-- 	}

-- 	export interface Game {
-- 		readonly type: "Game";

-- 		architecture: Architecture;

-- 		difficulties: Difficulty[];
-- 		difficultyToTower: Map<Difficulty, Tower>;

-- 		areas: Area[];
-- 		towers: Tower[];
-- 		nameToTower: Map<string, Tower>;
-- 		nameToArea: Map<string, Area>;

-- 		startClient(): void;
-- 		startServer(areasFolder: Instance): void;
-- 	}

-- 	export interface GameClient {
-- 		readonly type: "GameClient";
-- 	}

-- 	export interface GameServer {
-- 		readonly type: "GameServer";
-- 	}

-- 	export enum DifficultyPlacement {
-- 		Bottom = 0,
-- 		Low = 0.25,
-- 		LowMid = 0.375,
-- 		Mid = 0.5,
-- 		HighMid = 0.625,
-- 		High = 0.75,
-- 		Skyline = 0.9,
-- 		Top = 1,
-- 	}

-- 	export const version: string;
-- }

-- export as namespace Thorium;
-- export = Thorium;
