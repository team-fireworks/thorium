declare namespace Thorium {
	export interface Architecture {}

	export class DifficultyBuilder {
		static readonly type: "DifficultyBuilder";
		static readonly buildFrom: (difficulty: Difficulty | DifficultyBuilder) => DifficultyBuilder;

		titled(title: string): DifficultyBuilder;
		placed(placement: number): DifficultyBuilder;
		discordEmoji(discordEmoji: string): DifficultyBuilder;
		color(color: Color3): DifficultyBuilder;
		build(): Difficulty;
	}

	export interface Difficulty {
		readonly type: "Difficulty";
		title?: string;
		placement: number;
		discordEmoji?: string;
		color?: Color3;
	}

	class TowerBuilder {
		static readonly type: "TowerBuilder";
		constructor(name: string, difficulty: Difficulty, placement?: number);

		titled(title: string): TowerBuilder;
		abbreviate(abbreviate: boolean): TowerBuilder;
		creator(userId: number): TowerBuilder;
		ending(ending: unknown): TowerBuilder;
		build(): Tower;
	}

	export interface Tower {
		readonly type: "Tower";
	}

	export class TowerTypeBuilder {
		static readonly type: "TowerTypeBuilder";
		constructor(titled: string);

		pointsAwarded(pointsAwarded: number): TowerTypeBuilder;
		build(): TowerType;
	}

	export interface TowerType {
		readonly type: "TowerType";
		tower(name: string): TowerBuilder;
	}

	export class AreaBuilder {
		static readonly type: "AreaBuilder";
		constructor(name: string);

		titled(title: string): AreaBuilder;
		num(num: number): AreaBuilder;
		requirements(requirements: unknown[]): AreaBuilder;
		tower(tower: Tower): AreaBuilder;
		build(): Area;
	}

	export interface Area {
		readonly type: "Area";
	}

	export class WorldBuilder {
		static readonly type: "WorldBuilder";
		constructor(name: string);

		titled(title: string): WorldBuilder;
		areaNoun(singular: string, plural: string): WorldBuilder;
		area(area: Area): WorldBuilder;
		build(): World;
	}

	export interface World {
		readonly type: "World";
	}

	abstract class AnnouncerBuilder {
		announceDifficultiesAbove(difficulty: Difficulty): AnnouncerBuilder;
		announceOnlyDifficulty(difficulty: Difficulty): AnnouncerBuilder;
		announceDifficultiesBelow(difficulty: Difficulty): AnnouncerBuilder;
		build(): Announcer;
	}

	export class DiscordAnnouncerBuilder extends AnnouncerBuilder {
		static readonly type: "DiscordAnnouncerBuilder";

		webhook(webhook: string): DiscordAnnouncerBuilder;
		format(content: string): DiscordAnnouncerBuilder;
	}

	export class ChatAnnouncerBuilder extends AnnouncerBuilder {
		static readonly type: "ChatAnnouncerBuilder";
		format(content: string): DiscordAnnouncerBuilder;
	}

	export class GlobalChatAnnouncerBuilder extends AnnouncerBuilder {
		static readonly type: "GlobalChatAnnouncerBuilder";
		format(content: string): DiscordAnnouncerBuilder;
	}

	export interface Announcer {
		readonly type: "Announcer";
	}

	export class GameBuilder {
		static readonly type: "GameBuilder";
		titled(title: string): GameBuilder;
		announcer(announcer: Announcer): GameBuilder;
		difficulty(difficulty: Difficulty): GameBuilder;
		towerType(towerType: TowerType): GameBuilder;
		architecture(architecture: Architecture): GameBuilder;
		world(world: World): GameBuilder;
		build(): Game;
	}

	export interface Game {
		readonly type: "Game";

		architecture: Architecture;

		difficulties: Difficulty[];
		difficultyToTower: Map<Difficulty, Tower>;

		areas: Area[];
		towers: Tower[];
		nameToTower: Map<string, Tower>;
		nameToArea: Map<string, Area>;

		startClient(): void;
		startServer(areasFolder: Instance): void;
	}

	export interface GameClient {
		readonly type: "GameClient";
	}

	export interface GameServer {
		readonly type: "GameServer";
	}

	export enum DifficultyPlacement {
		Bottom = 0,
		Low = 0.25,
		LowMid = 0.375,
		Mid = 0.5,
		HighMid = 0.625,
		High = 0.75,
		Skyline = 0.9,
		Top = 1,
	}

	export const version: string;
}

export as namespace Thorium;
export = Thorium;
