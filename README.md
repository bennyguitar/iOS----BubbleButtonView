BubbleButtonView
================

Dynamically fill a subclassed UIView with rounded-corner UIButtons based off of an array of strings. This class also sequentially animates the adding and removing of buttons for a nice UI touch.

![ScreenShot](https://raw.github.com/bennyguitar/iOS----BubbleButtonView/master/BubbleButtonView/screenshot-01.png)


Code
================

The meat of the code is executed inside BBView.m and BBView.h, so import the header file and make sure to add the QuartzCore framework and import that as well. The BubbleButtonView works by feeding it an array of NSStrings - each one becomes a separate UIButton. I tried to make this fairly dynamic, so you also pass in the background/text colors of each button and the size of the text inside as arguments whenever you want to create them. Below is the code you would call.

```shell
[bubbleView fillBubbleViewWithButtons:NSArray bgColor:UIColor textColor:UIColor fontSize:float];
```

BBView also has three more functions: two for animating the addition/removal of buttons and one for the TouchUpInside data handling (each button receives a tag based on the original array you feed it).


Reap What I Sow!
================

This project and all code is under the standard MIT License. Please use this and twist it in whatever fashion you wish - and recommend any cool changes to help the code.
