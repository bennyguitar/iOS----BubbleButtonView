//
//  ViewController.m
//  BubbleButtonView
//
//  Created by Benjamin Gordon on 11/27/12.
//  Copyright (c) 2012 Benjamin Gordon. All rights reserved.
//
//  I made this just for fun, so please use the hell out of it.
//     -- bennyguitar
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Make sure you set bubbleView's delegate
    bubbleView.delegate = self;
    
    // A little UI Touch
    mainButton.layer.cornerRadius = 10;
    bubbleView.layer.shadowColor = [[UIColor blackColor] CGColor];
    bubbleView.layer.shadowOffset = CGSizeMake(0.0f, 2.5f);
    bubbleView.layer.shadowRadius = 5.0f;
    bubbleView.layer.shadowOpacity = 0.35f;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:bubbleView.bounds];
    bubbleView.layer.shadowPath = [path CGPath];
}



#pragma mark - IBAction for DEMO

- (IBAction)addButtons:(id)sender {
    // I'm just creating an array for demo purposes here.
    // -- Ideally, you'd have a class variable so that whatever scheme
    //    your data is in, you can use and manipulate it with this array.
    // -- These strings will serve as my bubble buttons
    NSArray *bubbleStringArray = @[@"Hello", @"this", @"is", @"a", @"test", @"of", @"the", @"BubbleButtonView", @"class", @"Each", @"one", @"of", @"these", @"is", @"a", @"button"];
    
    // Create colors for buttons
    UIColor *textColor = [UIColor colorWithRed:255/255.0 green:47/255.0 blue:51/255.0 alpha:1.0];
    UIColor *bgColor = [UIColor colorWithRed:254/255.0 green:255/255.0 blue:235/255.0 alpha:1.0];
    
    // Now make them sucka's.
    [bubbleView fillBubbleViewWithButtons:bubbleStringArray bgColor:bgColor textColor:textColor fontSize:14];
}


#pragma mark - BubbleButton Delegate
-(void)didClickBubbleButton:(UIButton *)bubble {
    // Do something here
    // Use bubble.tag to use your data in the array
    // -- or bubble.titleLabel.text to access the string
    // -- etc.
    
    // Removing all buttons for demo purposes
    [bubbleView removeBubbleButtonsWithInterval:0.034];
}


#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
