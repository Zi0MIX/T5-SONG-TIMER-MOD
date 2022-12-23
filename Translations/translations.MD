# A tale of failure

The idea of creating translations came to life after HitmanVere added those for his BO3 custom map. And that was the last moment i believed that was going to be a painless experience.

## Directories

After receiving translated files (credits later) i begun attempts of implementing them. And i kept on failing and here's stuff i tried to do
- Multiple language values in one str file
Simple, added all the translations into one file
```
REF             "str_ref"
LANG_ENGLISH    "str in english"
LANG_POLISH     "str in polish"
LANG_SPANISH    "str in spanish"
```
And so on, that approach however failed, the result was essentially the game reading the last entry for each ref, so if we were to use example from above, it'd display stuff in spanish

- Directories
```<mod_dir>\localizedstrings\<language>\<str_file>```
and
```<mod_dir>\<language>\localizedstrings\<str_file>```
just didn't work, with the 2nd pattern being recommended to me by both people and the few sources i could find on the internet

- Directly putting stuff in `raw` folder
According to one of the comments in [this](https://www.itsmods.com/forum/Thread-Tutorial-Adding-Localized-Strings.html) thread, i tried applying 2nd pattern from above but putting it in the raw directory, instead of the mod folder in mods. And that sort of did the trick, but also implemented a whole new set of issues

## Getting the files to work

So after moving my language folders to raw directory, here is what started happening next

- Just compiling stuff
Content would remain in english

- Trying both `-language` and `-baselang` arguments
The game would try to display the hud in the language specified in the argument, but that doesn't cut it, since i want the language from the mod matching language in the game. Another problem is that, despite trying it with matching game language, the text display is completely problem, for instance trying russian localization would only display some random ass symbols.

And that'd be a good moment to talk about text encoding, after going through linkermod commit history, it would appear all str files are required to be in `utf-8`. And i tried both that, as well as providing them to the game with matching encoding, and in both cases text was broken

- Multiple FF files
That simply didn't work, i tried compiling the full mod as well as just localizedstrings to separate ff files and addind them either to the main mod directory or separate folders (named after languages) with ff files having language prefixes (for instance `po_mod.ff` for polish, `fr_mod.ff` for french etc), and that also didn't work. Going through console.log, it seems as game_mod is always trying to load just one fast file, that file being `mod.ff`.

- IWD files
At all stages i tried just dumping them to IWD files, but it seems BO1 simply doesn't take str files from IWDs, so that's a dead end.

## Summary

After writing that down it doesn't seem like much, but trying different combinations at each stage was worth few full days, kinda dissapointed that i couldn't crack it. This document is made in case i ever stumble on some more clues, or someone else would want to pick up on this. At this stage i don't know if i'm just missing something, or is it a problem with linker, don't want to point fingers cause i simply don't know. I tried asking all cod modders i know, who tried but couldn't help, as well as tried asking in linker discord (0 reaction from anyone lol). So ye, i leave it at that for now.

# Credits
- Austrian / German - [Raining](https://twitter.com/RaiiNZombies)
- French - [Flo203](https://www.twitch.tv/lflo203)
- Polish - Me
- Russian - Justindn
- Spanish - [Daniel](https://twitter.com/AfricanRecords1)