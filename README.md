BubbleButtonView
================

Dynamically fill a UIView with rounded-corner UIButtons based off of an array of strings. This class also sequentially animates the adding and removing of buttons for a nice UI touch.


Code
================

All of this code is executed inside the ViewController, so extra subclasses or categories are unnecessary. All you need is a mutable array and a UIView to display the buttons in. There are four methods that do all of the work here. One creates the buttons, one animates their addition to the view, one animates their removal, and one serves as a data manipulation method for clicking on said button.


Reap What I Sow!
================

Please use this, and recommend changes to help the code. I just wanna' see interesting art for iOS when necessary.


For the Future
================

Right now this is non-ARC, so I will make an ARC version soon as well.