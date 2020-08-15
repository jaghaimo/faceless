# Faceless

A Starsector tool to remove all portraits from all factions.

## How does it work?

This tool creates a mod that will remove all vanilla and all mod-introduced portraits.

Portraits portion of faction file normally gets merged together.
When the merging array is empty though, either as a bug or deliberate behaviour, the resulting array is empty as well.

Using this behaviour it is possible to reset all factions to have no portraits at all.
By loading a custom portrait pack after this reset has happened the game will only see newly added portraits.

## How do I use it?

* Run `generate.sh` (Linux/Mac users are set to go, Windows users will need WSL1/WSL2, Cygwin, or Git Bash)
* If this is your first time using it, it will complain about lack of `faction.list` - a file that contains all vanilla and modded factions - generate it
* Next it will complain about lack of `player.faction` - a list of male and female portraits to use - pick it from the mod you want to have in your game
* Now it will finally run and generate `faceless-1.0.0.zip` mod and `data/` folder
* Install and enable `ZZZ Faceless` mod
* Starsector will now crash if you try to start a new game as there are no portraits to use
* Now copy `data/` into the portrait pack of your choice
* Edit `mod_info.json` of that portrait pack and add `zzzz_` in front of id and `ZZZZ ` in front of the name - this ensures that the mod is loaded after the initial purge done by `Faceless`
