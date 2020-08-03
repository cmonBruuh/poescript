# poescript

I have been using this script since the Legion League.

It's not just a flask script but brings additional features.

First some important information:

- I have provided a folder EXE. It's up to you if you use master.ahk or master.exe
- AHK must be downloaded.
- The .exe files are identical to the .ahk files, just compiled.
- I do not take any liability for bans. I can say that I have been using the script for a while and nothing has happened yet. I think a big part of the POE community uses Flask Scripts or similar.
- This script only supports 1920x1080 display. Other resolutions I have not tested. If the script is only used for Flasks, it should work with other resolutions as well.

How do I download this script?

- Download the zip
- Start ONLY the master.exe or master.ahk file (that is up to what you prefer). You can ignore the other(Flask).exe/.ahk files.
- The script will open in the lower right corner of your screen (overlaps the mana display).

![snapshot](https://github.com/cmonBruuh/poescript/blob/master/Snapshot.PNG?raw=true)

Functions:

- You can use the "?" button to view all functions. A new window with the functions will open. With another click on "?" you can hide the information again.

Flasks and Timer:
- There are three different ways to use the Flask script.
- In this section I explain one of them.
- In the field "Flasks" you can enter the Flasks hotkeys. Here 1-5 are supported (default in POE). The following variants are available:
1, 12, 123, 1234, 12345, 2, 23, 234, 2345, 3, 34, 345, 4, 45, 5
- With the field "Timer" you can specify the milliseconds that should pass between the activation of the flasks.
- If you have a Quicksilver Flask that lasts 4.5 seconds, it makes sense to enter 4500 in the field. The field always needs the milliseconds.
- Example: I have 4 flasks that I don't want to push manually. These are in slots 2, 3, 4 and 5, because in the first slot I have a Life Flask. So I enter 2345 in the field " Flasks" and 4000 in the "Timer" field. The Flasks 2, 3, 4 and 5 are automatically triggered every 4 seconds.

State:
- Shows whether the script is running or sleeping.

Lvling:
- second variant for Flasks
- Please read the "Flask and Timer" part carefully.
- This function is intended to make leveling easier. Often players use multiple Quicksilver Flasks during the leveling process. For example in ingame slot 3 4 and 5.
- This option only supports the following Flasks variants:
45 and 345
- Example: I use a Quicksilver Flask in slot 3 4 and 5. All last 4 seconds (4000 milliseconds). I enter 345 in the field "Flasks", 4000 in the field "Timer" and activate "Lvling".

Button one, two, three, four and five:
- third variant for Flasks
- when this function is used, the other two functions cannot be used.
- The individual buttons can be used to enter the milliseconds that should elapse between the activation of each flash.
- This function is powerful, because you can specify the exact cool down time for each flask.
- Example: In Flask Slot 1, I have a Life flask, so I don't have to enter anything. In the second ingame Flask Slot I use a Basalt Flask with 7sec. So I press the button "2" and enter 7000. Then I confirm with OK. I repeat this step for the other flasks I want to automate. The values will be saved and will stay on as long as the script is running.

Button X:
- This button deletes all stored flasks and allows you to re-enter them.
- If you only want to delete e.g. Flask 2, you have to do this manually via the tray menu.

More functions (only possible with resolution 1920x1080):
- These functions can be called via the help menu "?".
- With F6 you fill your inventory with the maps from Map Stash. How? Open Map Stash (and right you have to have the inventory). You have to be at the map you want to transfer into your inventory. F6 fills the whole inventory with the selected map.
- F7 applies a currency to the whole inventory. You have to have the inventory on the right and the stash on the left. You press right click on the currency and press F7. The currency will be applied to the whole inventory (e.g. alchemize all maps or identify many rings)
- With F10 you move items from left to right in the inventory (I created this mainly for self use)
- With CTRL+NUMPADX (X stands for a number) you transfer items in the inventory to the stash (or trade). A number stands for the number of columns in the inventory that can be transferred.

Hotkeys:
- F2: Start Flask Script
- F3: Stop Flask Script
- F6: Get Maps our of Map Stash
- F7: Use Currency on inventory
- F10: Move Items to right side in Inventory
- CTRL+NumpadX: Moves x Inventory columns to stash
- CTRL+Numpad0: Moves all Inventory to stash

If you have any questions leave me a message in Discord: DisWa#1276
