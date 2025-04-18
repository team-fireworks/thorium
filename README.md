# Thorium

Thorium is a framework for Eternal Towers of Hell fangames.

- No more teleport screens with one omniplace for all areas
- Customizable with numerous builder patterns, and outward-facing APIs
- Extensible with numerous interfaces and hooks
- Type safe Luau and TypeScript API
- Built on state-of-the-art Roblox open source software
- Supports Eternal Towers of Hell v6 and v5 kits, but you can implement your own

## Usage

In a shared module, define your game using the GameBuilder class.

```Luau
return GameBuilder.new()
	:titled("Eternal Towers of Hell")
	:architecture(ThoriumForEToHv5.architecture)
	:towerType(ThoriumForEToHv5.Tower)
	:difficulty(ThoriumForEToHv5.Insane)
	:announcer(
	    GlobalChatAnnouncerBuilder.new()
			.format("[GLOBAL] $player beaten $towerTitle in $time!")
			.format("$player beaten $towerTitle in `$time`!")
			.announceDifficultiesAbove(ThoriumForEToHv5.Insane)
			.build(),
	)
	:world(
    	WorldBuilder.new("TGI")
    	    :titled("The Great Inferno")
            :areaNoun("Ring", "Rings")
           	:area(
          		AreaBuilder.new("A1MoltenHeart")
         			:titled("Molten Heart")
         			:num(1)
         			:tower(
        				Tower:tower("TT")
           					:titled("Thanos Tower")
           					:difficulty(ThoriumForEToHv5.Insane, DifficultyPlacement.Low)
           					:build(),
         			)
         			:build(),
           	)
    	)
	)
	:build();
```

In the server and the client, start the game:

```Luau
local towerGame = require(ReplicatedStorage.Game)
-- client
local client = towerGame:startClient()
-- server
local server = towerGame:startServer()
```

Both the `client` and `server` can be used to interact with the game including
attaching default UI or a Realm Select:

```Luau
local realmSelect = ThoriumRealmSelect.new(client)
local ui = ThoriumEToHUi.new(client)

realmSelect:load()
```

## Packages

thorium: Entry point
thorium-ui: Implements a basic game UI, useful for testing
thorium-realm-select: Implements a basic ring select, useful for testing
thorium-for-etoh-v5: Implements the EToH v5 `Architecture` with ClientObjectScripts
thorium-for-etoh-v6: Implements the EToH v6 `Architecture` with RunRepoScripts
thorium-net: Internal package to implement buffer networking

## Games Using Thorium

### Welcome To Hell (Upcoming 2025)

Thorium was a product from Team Fireworks' Welcome To Hell fangame engine. The
game (will) use a custom `Architecture` with Mechanics and
[Jecs](https://github.com/Ukendio/jecs).

[![Early Dev Video](https://img.youtube.com/vi/5WySYeGqVu0/0.jpg)](https://www.youtube.com/watch?v=5WySYeGqVu0)
