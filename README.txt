Eve Live Viewer 1.1
Author: David Lockwood
----------------------------------
Full Download can be found at (https://www.dropbox.com/sh/9ypujjn74tzh2rq/ds9Zre9gUR)

All icons and images are the property of CCP Games.

Requirements:
------------
An iPad loaded with the Codea App.  (http://itunes.apple.com/us/app/codify/id439571171?ls=1&mt=8)
iExplorer (http://www.macroplant.com/iexplorer/)

Install:
------------
1:Download a copy of iExplorer.
2:Plug in iPad
3:Run iExplorer
4:Copy Eve Live View.spritepack to the /Apps/com.twolivesleft.Codify/Codea.app/SpritePacks directory
5:Copy Eve Live Viewer.codea to the /Apps/com.twolivesleft.Codify/Documents directory
6:Run Codea

Known Issues v1.2:
-------------
-Landscape Mode has some Display Issues, Disabled until Fixed.


Version History:
-------------
-v1.2(6/15/2012)
--Cleaned up some minor code
--Began incorporating Historical Notification Code (Not Active/working yet)
--Changed the Notification Window Background
--Removed some unsightly borders around some buttons on the map screen
--Added an informational line about Dotlan's Radar functionality, as it where to get your token.
--Changed the way Notifications were handling Go to Events. No longer uses the search bar to move.

-v1.1(6/10/2012)
--Incorporated Dotlan Faction Warfare,Sov,Alliance, and other Feeds to Notifications
--Incorporated Dotlan's Radar Feature
--Changed the "Go to Event" Setting to "Go To..." and added the ability to go to Dotlan Radar
--Began adding Alliance Sov Status into the System Bar

-v1.0(6/3/2012)
--Updated to Release Code
--Updated Settings Text

-v0.69a(6/2/2012)
--Filtering by Ship Class Type is now in.

-v0.68a(6/1/2012)
--ISK Filtering is now in.
--Behind the scene tweaks to keep from crossing the streams
--Corrected a problem with the Stars and Lines Toggle allowing you to click options without the toggle menu open
--Starting backend integration for adding Ship Category Filtering (IE: Filter by Capital Ships, Freighters, etc)

-v0.67a (5/30/2012)
--Fixed ISK value bugs
--Integrated ISK Values in to Notifications
--Added Various Missing TypeIDs
--Cleaned up Eve-Kill REST API parsing to parse more accurately
--TypeID Problems have been cleared up using a bit of Python Magic. Keep an eye out for any strays.

-v0.66a (5/29/2012)
--Fixed Communication Error not displaying and causing horrible, horrible crash.
--Locked Orientation to Portrait Until Landscape Bugs fixed.

-v0.65a (5/28/2012) 
--Cleaned up the UI. 
--Stars and Lines settings button now hides/displays the options. 
--Collapsed the System Info bar to be toggled by a button.
--Added Regional Notification Filtering.  Multiple Regions may be selected at once. Make sure the switches are on for Notifications, Filters, and Regional Filters.
--Removed Badly Drawn Sprites and replaced with sparkly CCP Sprites.

To Do:
-------------
-Incorporate evemaps.dotlan.net XML Data for System Stats
-Incorporate Eve-Central's new Route Planning to create filtering by Route
