BubbleButtonView
================

Dynamically fill a subclassed UIView with rounded-corner UIButtons based off of an array of strings. This class also sequentially animates the adding and removing of buttons for a nice UI touch.

![ScreenShot](https://raw.github.com/bennyguitar/iOS----BubbleButtonView/master/BubbleButtonView/screenshot-01.png)

## Installation ##

Drag the included <code>BBView.m, BBView.h</code> files into your project. Then, include the following frameworks under *Link Binary With Libraries*:

* QuartzCore.framework

## Using BBView ##

Make sure to <code>#import BBView.h</code> into whatever ViewController you want to use the BubbleButtonView in.

BBView works by taking an array of NSStrings and creating a UIButton for each one. The buttons are systematically added to the View such that they will fit on the line next to the last one, or if it won't fit, added on a new line. Because BBView's animations work via subviews (each UIButton is a subview of BBView), you should make BBView the lowest level possible - don't add more UI elements to BBView. Keep it simple.

Begin by making a new UIView in your ViewController.xib, and changing its class to BBView (through the identity inspector in the right bar). Drag this over to your ViewController.h to connect it up. In your .h

```shell
@interface ViewController : UIViewController {
  __weak IBOutlet BBView *bubbleView;
}
```

Now, to fill the BBView with your buttons, first create an NSArray of NSStrings. Ideally, this would tie into data you wish to manipulate - this part is entierly dependent on your project and what you wish to do. BBView also has arguments for the background color, text color and font-size for each button. This is for UI and again, entirely up to you. This is the function you should call inside your ViewController:

```shell
[bubbleView fillBubbleViewWithButtons:NSArray bgColor:UIColor textColor:UIColor fontSize:float];
```

Each UIButton is given a tag based on the index of the array you pass in. Use the <code>-(void)didClickBubbleButton:(UIButton *)bubble;</code> method inside <code>BBView.m</code> to manipulate your data. Use <code>bubble.tag</code> to do so.


Reap What I Sow!
================

This project is distributed under the standard MIT License. Please use this and twist it in whatever fashion you wish - and recommend any cool changes to help the code.
