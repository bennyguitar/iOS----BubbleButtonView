//
//  ViewController.h
//  BubbleButtonView
//
//  Created by Benjamin Gordon on 11/27/12.
//  Copyright (c) 2012 Benjamin Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

// Note that I'm importing QuartzCore - Don't forget it!
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController {
    // Array for holding the Bubble Buttons after creation
    // -- that way you can animate/use them later
    NSMutableArray *bubbleButtonArray;
    
    // View that holds bubble buttons
    IBOutlet UIView *bubbleView;
}

// IBAction for demo purposes
- (IBAction)addButtons:(id)sender;

@end
