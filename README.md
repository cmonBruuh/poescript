# poescript

V3.0 Update:

- Prophecy buy function removed
- Throws inventory items to the ground function removed
- Removed the "Blocked" state

- Added support for resolution 1920x800
- Resolution can be changed in the "window.ini" file (default is set to 1920x1080)
- You can configure the coordinates of your inventory for "Inventory to stash" function
- Introduced a "Hideout" Button which you can click to get to your hideout
- You can abrubtly end any function now with F12 (default Hotkey)

...and more smaller things

--------------------------------------------------------------------------------------------------------------------

V2.4 Update:

- NEW FUNCTION: SKILL SEQUENCE (read at the end of this readme for more info)
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
- I take no responsibility for bans. 
- This script is against GGG TOS

How do I download this script?

- Download the zip
- Extract the zip to a random location
- Start ONLY the master.ahk file. Ignore the other .ahk files/folders.
- The script will open in the lower right corner of your screen .

![snapshot](https://github.com/cmonBruuh/poescript/blob/master/Snapshot.PNG?raw=true)

Functions:

- You can use the "?" button to view all functions. A new window with the functions will open. With another click on "?" you can hide the information again.

Hotkeys:
- F2: Start Flask Script
- F3: Stop Flask Script
- F7: Use Currency on inventory
- F10: Opens stacked decks in first row of inventory
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

Button 1, 2, 3, 4 and 5:
- third variant for Flasks
- you can combine this function with the "Lvling" function
- The individual buttons can be used to enter the milliseconds that should elapse between the activation of each flask.
- This function is powerful, because you can specify the exact cool down time for each flask.
- Example: In Flask Slot 1, I have a Life flask, so I don't have to enter anything. In the second ingame Flask Slot I use a Basalt Flask with 7sec. So I press the button "2" and enter 7000. Then I confirm with OK. I repeat this step for the other flasks I want to automate. The values will be saved and will stay on as long as the script is running.

More functions:
- Spam can be helpful if you want to 6 Link or 6 Socket an item and need to spam currency
- F7 applies a currency to the whole inventory. Right click the currency and press F7 to use the currency on the items in your inventory
- F10 opens stacked decks in the first row of your inventory and throws them to the ground (go to a area f.ex. menagerie for that)
- F12 abrubtly end functions
- With CTRL+NUMPADX (X stands for a number) you transfer items in the inventory to the stash (or trade). A number stands for the number of columns in the inventory that can be transferred.

Spam:
- This function is useful for 6-socketing or 6-linking an item where you want to spam Jeweller's/Fusing Orbs
- Click the spam button and enter how many times the currency should be applied to an item
- Click the random checkbox for random click intervalls (harder to detect), leave it if you want to go FAST
- Right Click on the currency and hover your mouse over the item
- Hold Shift and click on the Pause/Break button on your keyboard
- If you want to abruptly end the macro click on Pause/Break again (first stop holding down the shift key!)
- Click count must be between 1 and 999

Use Currency on inventory:
- Very helpful if you want to prepare maps
- Right Click a Currency (f.ex. Chisel, Alchs) and click your Hotkey (default F7)
- It will use this currency on your whole inventory
- End this function with your End Hotkeys (default F12) if you need to 

Stacked deck:
- Line up 50 stacked decks in the left column in your inventory (10 per cell)
- Go in a map or area (f.ex. blood aquedact act 9)
- Click F11 to open 50 stacked decks very fast
- End this function with your End Hotkeys (default F12) if you need to 

Skill Sequence (SQ):
- Lets you define a skill (Letter) which will be executed automatically after you pressed a skill (Letter)
- Skill 1 is the key you press for your main skill (f.ex. Bladefall)
- Skill 2 is the key THAT will be pressed after a defined time (f.ex. 
- Elapsetimer defines how many MILLISECONDS are elapsing between your keypress and the automatic execution of Skill 2

Save timers:
- You can save your timers in the Timers.ini inside the Timers folder
- Setup your timers which will be saved until you change it again in this file
- When you start your script you don't have to manually enter any of the timers again. Just click on each saved button and it will detect it.
- You can still enter the timers the old way through the buttons
- timers in the .ini file are set to null (that means nothing/empty) - so make sure if you remove timers again that you remove also backspaces

Resolution:
- Only 1920x1080 and 1920x800 are supported
- If they don't match your resolution read the introduction to coordinates below

Setup your own inventory coordinates:
- Open windowsspy.ahk and coordinates.ini inside your settings folder
- Now we need to find the coordinate of the top left cell and the bottom right cell in your inventory
- (Imagine a rectangle where you want to find out the top left and bottom right point on the rectangle)
- Move your mouse to the center of that small cell on the top left and note the mouse coordinates (Window: xxxx, xxx (default)
(- You have to make sure that you're in POE and that on the top of windowsspy.ahk it says poe)
- Repeat the same thing for the bottom right cell of your inventory
- Now that you have these coordinates you want to do the following:
	xStart="Top Left First Number (x)"
	yStart="Top Left Second Number (y)"
	xEnd="Bottom Right First Number (x)"
	yEnd="Bottom Right Second Number (y)"
- It should look like something like this:
	xStart=1256
	yStart=632
	xEnd=1478
	yEnd=876
- Save the file and restart the script
- If you use any function it should automatically detect your coordinates


If you have any questions leave me a message in Discord: Near#2133
