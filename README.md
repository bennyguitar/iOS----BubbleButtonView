BubbleButtonView
================

Dynamically fill a UIView with rounded-corner UIButtons based off of an array of strings. This class also sequentially animates the adding and removing of buttons for a nice UI touch.

![ScreenShot](https://raw.github.com/bennyguitar/iOS----BubbleButtonView/master/BubbleButtonView/screenshot.png)


Code
================

All of this code is executed inside the ViewController, so extra subclasses or categories are unnecessary. All you need is a mutable array and a UIView to display the buttons in. There are four methods that do all of the work here. One creates the buttons, one animates their addition to the view, one animates their removal, and one serves as a data manipulation method for clicking on said button. Make sure you add the QuartzCore framework, then #import it into your ViewController.h


Reap What I Sow!
================

This project is distributed under the standard MIT License. Please use this and twist it in whatever fashion you wish - and recommend any cool changes to help the code.


For the Future
================

Right now this is non-ARC, so I will make an ARC version soon as well.
