# A patch with automated timers for accurate timing of song speedruns.

### Timing rules
- Start position: When screen fades in </br>
- Finish position: Immidiately after all conditions required for playing the music are met </br>

### Details
- Mod should work on Plutonium, however it has not been tested or verified for it, it's meant for Steam version. If you play on Plutonium, try not to join games in progress. </br>
- Patch supports all BO1 Song Easter Eggs </br>
- Patch does not change any game rules besides setting Strafe & Backspeed to console values. </br>
- If you want to report a problem or request a feature, you may use the Issues section. </br>
- [GameMod](https://github.com/Nukem9/LinkerMod/releases/tag/v1.3.2) is **required** for this mod to work. Simply put most recent release in `Mods` folder inside your BO1 folder. Please reffer to [Google](https://www.google.com/search?q=black+ops+1+%22gamemod%22+installation) if you do not know how to install GameMod to your BO1. No it won't get you banned and it won't screw your game in any way.

### Features

##### Auto splits for songs. 
- Accurate to 2 decimal points (functions refresh every 0.05 seconds, which is the highest rate a GSC script can run on).

##### HUD
- Built-in timer (seconds) showing on the screen at all times.
- Attempt counter
- Song lock tracker
- Point drop tracker
- Velocity meter & Gspeed tracker

##### Game
- Backspeed and strafespeed scales set to 1

### Plans
- Progress tracking for song completition
- White & blue player always spawn on Jug Side

# Changelog
### V1.1
- Applied forgotted check to enable trigger delay for 8-bit songs. All games played on V1.0 for Re-Damned, Pareidolia 8-bit & Coming Home 8-bit should add flat 4 seconds to final time.