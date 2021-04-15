# poescript


V2.3.1 Update:

- Inventory to stash with CTRL+Numpad+ is fast again (STRONGLY RECOMMEND NOT USING FOR TRADE)
- Hotkey setup with "Hotkeys.ahk" (except Inventory to stash function)

--------------------------------------------------------------------------------------------------------------------

V2.3.1 Update:

- Inventory to stash function speed from V2.3.0 reverted to its original speed (because trading became suspicious)

--------------------------------------------------------------------------------------------------------------------

V2.3.0 Update:

- Inventory to stash function is significantly faster now
- Chancing function removed
- Move Maps to right function removed
- Get maps out of map stash function removed
- Prophecy buy function added (read at the end of readme how to use it)
- Inventory to ground function added (read at the end of readme how to use it)

--------------------------------------------------------------------------------------------------------------------

V2.2 Update:

- Spam function is  significantly faster
- Notes function removed
- X function removed due to not working (if you set up new flasks via 1,2,3,4,5 it overwrites the old one!)
- New function "Spam stacked deck" added (read at the end of readme how to use it)

--------------------------------------------------------------------------------------------------------------------

V2.1 Update:

- Added a currency spam (f.ex. fusing)
- Read the section "Spam" in this file for more information

--------------------------------------------------------------------------------------------------------------------

V2.0 Update:

- Added skills to be automated (read the Flasks and Timer section for this)
- Updated repo
- Removed EXE files which means you need AHK to execute the script

--------------------------------------------------------------------------------------------------------------------

I have been using this script since the Legion League.

It's not just a flask script but brings additional features.

First some important information:

- AHK must be downloaded.
- I do not take any liability for bans. I can say that I have been using the script for a while and nothing has happened yet. I think a big part of the POE community uses Flask Scripts or similar.
- This script only supports 1920x1080 display. Other resolutions I have not tested. If the script is only used for Flasks, it should work with other resolutions as well.

How do I download this script?

- Download the zip
- Extract the zip to a random location
- Start ONLY the master.ahk file. Ignore the other .ahk files/folders.
- The script will open in the lower right corner of your screen (overlaps the mana display).

![snapshot](https://github.com/cmonBruuh/poescript/blob/master/Snapshot.PNG?raw=true)

Functions:

- You can use the "?" button to view all functions. A new window with the functions will open. With another click on "?" you can hide the information again.

Hotkeys:
- F2: Start Flask Script
- F3: Stop Flask Script
- F7: Use Currency on inventory
- F9: Prophecy buy
- F10: Opens stacked decks in first row of inventory
- F11: Throws inventory items to the ground
- F12: Abrubtly ends function F9, F10 and F11
- CTRL+NumpadX: Moves x Inventory columns to stash
- CTRL+Numpad0: Moves all Inventory to stash

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
- you can combine this function with the "Lvling" function
- The individual buttons can be used to enter the milliseconds that should elapse between the activation of each flask.
- This function is powerful, because you can specify the exact cool down time for each flask.
- Example: In Flask Slot 1, I have a Life flask, so I don't have to enter anything. In the second ingame Flask Slot I use a Basalt Flask with 7sec. So I press the button "2" and enter 7000. Then I confirm with OK. I repeat this step for the other flasks I want to automate. The values will be saved and will stay on as long as the script is running.

More functions (only possible with resolution 1920x1080):
- These functions can be called via the help menu "?".
- F7 applies a currency to the whole inventory. Right click the currency and press F7 to use the currency on the items in your inventory
- F9 will buy you a whole inventory of prophecies. Go to Navali and leave the bottom right prophecy slot EMPTY
- F10 opens stacked decks in the first row of your inventory and throws them to the ground (go to a area f.ex. menagerie for that)
- F11 throws your whole inventory to the ground (go to a area f.ex. menagerie for that)
- F12 abrubtly end function "Prophecy buy", "Open stacked decks", "Whole inventory to ground"
- With CTRL+NUMPADX (X stands for a number) you transfer items in the inventory to the stash (or trade). A number stands for the number of columns in the inventory that can be transferred.

Spam:
- This function is useful for 6-socketing or 6-linking an item where you want to spam Jeweller's/Fusing Orbs
- Click the spam button and enter how many times the currency should be applied to an item
- Click the random checkbox for random click intervalls (harder to detect), leave it if you want to go FAST
- Right Click on the currency and hover your mouse over the item
- Hold Shift and click on the Pause/Break button on your keyboard
- If you want to abruptly end the macro click on Pause/Break again (first stop holding down the shift key!)
- Click count must be between 1 and 999

Prophecy buy:
- Go to Navali
- Fill up your prophecy until ONLY your bottom right prophecy slot is empty
- Click F9 to fill your inventory with prophecies
- End this function with F12 if you need to

Spam stacked deck:
- Line up 50 stacked decks in the left column in your inventory (10 per cell)
- Go in a map or area (f.ex. blood aquedact act 9)
- Click F10 to open 50 stacked decks very fast
- End this function with F12 if you need to

Inventory to ground:
- Go in a map or area (f.ex. blood aquedact act 9)
- Open your inventory
- Click F11 to throw all items on the ground
- End this function with F12 if you need to


If you have any questions leave me a message in Discord: Saibot#1276
