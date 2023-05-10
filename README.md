**With this patch, forget about having to manually time Black Ops I Zombies Song Speedruns.**

# The mod is discontinued!!!

Mod support ends with version 3.0, i do not agree with the community decision of allowing Plutonium for competitive song games, therefore i've decided to stop supporting it. I may fix some critical bugs if any occur, but features or non-critical bugs won't be worked on. I may accept pull requests if they preserve ruleset integrity.

# Timing rules

- Start position: When screen fades in, besides Ascension where timer starts after players are freed from the lander
- Finish position: Immidiately after all conditions required for playing the music are met

# Timing technicalities

The reason why splits and song times are usually multiplications of 50ms inverals is, that that's the internal speed of how fast game scripts refresh (20hz = 20 times a second = 50ms). The reason why this is actually accurate is that events such as starting songs are fully mangaged from inside of game scripts.
For example, song cannot start at 10.07s because that's physically impossible, it'll start at 10.10s, even if you press the item at 10.07s. Sometimes those inverals can be higher (due to how Treyarch coded the logic of some songs, for example Mob of the Dead), but it'll always be multiplications of 50ms.

# Instalation
How to install the mod.

## Steam

[GameMod](https://github.com/Nukem9/LinkerMod/releases/tag/v1.3.2) is **required** for this mod to work. Simply unzip the most recent release and put it in `Mods` folder inside your BO1 folder. Please reffer to [Google](https://www.google.com/search?q=black+ops+1+%22gamemod%22+installation) if you do not know how to install GameMod to your BO1. No it won't get you banned and it won't screw your game in any way. [Video tutorial](https://youtu.be/k92N0RlBDBk) by Skimpy.

## Plutonium

Create `mods` folder in `\AppData\Local\Plutonium\storage\t5` and put unzipped directory from most recent release there.

# Features

- The mod is built for steam, however it succesfully launches on Plutonium. I cannot guarantee that all the functions work properly.
- Patch supports all BO1 Song Easter Eggs.

## Auto splits for songs. 

Accurate to 2 decimal points (functions refresh every 0.05 seconds, which is the highest rate a GSC script can run on, look at [Timing Technicalities](https://github.com/Zi0MIX/T5-SONG-TIMER-MOD/blob/main/README.md#timing-technicalities) section).

## HUD
- Built-in timer (seconds) showing on the screen at all times.
- Splits for each song
- Attempt counter
- Point drop tracker
- Velocity meter
- Zone name

## HUD Color
Available selections:

| String | RGB value |
| --- | --- |
| red | 1, 0, 0 |
| green | 0, 1, 0 |
| blue | 0, 0, 1 |
| orange | 1, 0.5, 0 |
| yellow | 1, 1, 0 |
| light green | 0.5, 1, 0 |
| mint | 0, 1, 0.5 |
| cyan | 0, 1, 1 |
| light blue | 0, 0.5, 1 |
| purple | 0.5, 0, 1 |
| light pink | 1, 0, 1 |
| white | 1, 1, 1 |

## Game
- Backspeed and strafespeed scales set to 1
- White & Blue player always spawn on South side (Jug Side) on Verruckt
- Added alerts for stuff like join in progress or wrong network frame (in case pluto breaks it)

## Moon
You have to pre-select song for Moon, otherwise timing functions won't work. Do it by setting `/split` to one of the values:

| Song | Song call |
| --- | --- |
| Coming Home | `coming home` |
| Nightmare | `nightmare` |
| Re-Damned | `redamned` |
| Coming Home 8-bit | `coming home 8` |
| Pareidolia 8-bit | `pareidolia 8` |

# Changelog

List of changes that happened throught the development cycle

## V1.1

- Applied forgotten check to enable trigger delay for 8-bit songs. All games played on V1.0 for Re-Damned, Pareidolia 8-bit & Coming Home 8-bit should add flat 4 seconds to final time.

## V2.0

- Velocity Meter is now changing colors depending on the speed
- Sound lock HUD has been disabled
- Zone name now shows in left bottom corner
- Songs now have splits
- Moon now requires pre-selection of the song
- Verruckt spawns are now set for White & Blue to always spawn on Jug Side

## V2.1

- Velocity Meter was changed to look like on First Room Fix
- GSPEED is not longer displaying at all times, instead an allert is triggered if the value is changed
- Fixes to `split` dvar.

## 3.0

- Mod can now detect the client it's used on
- Mod checks for network frame (tickrate) and also automatically overrides it to proper values on plutonium
- A warning is displayed if players join in progress
- Zone hud now waits on Der Riese until the map prompt disappears
- Hud color can now be changed via `hud_color` dvar
- Dvars don't reset between game sessions, so they can be set in the config
- Velocity meter can now be resized using `velocity_size` dvar (takes values between 1.0 and 4.0)
- Timing rules changed for Ascension, now times are calculated from when players are freed from the lander
- Fixed wrong label for 2nd split on Ascension

# Translations
An attempt was made to make the mod have multiple language support, that however failed, you can read about in the translations doc in /Translations directory on GitHub