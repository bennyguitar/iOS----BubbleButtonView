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
    
    // Init bubbleButtonArray
    bubbleButtonArray = [@[] mutableCopy];
    
}

#pragma mark - Bubble Button Methods

-(void)fillBubbleViewWithButtons:(NSArray *)strings bgColor:(UIColor *)bgColor textColor:(UIColor *)textColor fontSize:(float)fsize {
    
    // Create padding between sides of view and each button
    //  -- I recommend 10 for aesthetically pleasing results at a 14 fontSize
    int pad = 10;
    
    // Iterate over every string in the array to create the Bubble Button
    for (int xx = 0; xx < strings.count; xx++) {
        
        // Find the size of the button
        NSString *bub = [strings objectAtIndex:xx];
        CGSize bSize = [bub sizeWithFont:[UIFont systemFontOfSize:fsize] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        
        // Turn it into a rect
        CGRect buttonRect = CGRectMake(pad, pad, bSize.width + fsize, bSize.height + fsize/2);
        
        
        // if new button will fit on screen, in row:
        //   - place it
        // else:
        //   - put on next row at beginning
        if (xx > 0) {
            UIButton *oldButton = [[bubbleView subviews] objectAtIndex:bubbleView.subviews.count - 1];
            if ((oldButton.frame.origin.x + (2*pad) + oldButton.frame.size.width + bSize.width + fsize) > bubbleView.frame.size.width) {
                buttonRect = CGRectMake(pad, oldButton.frame.origin.y + oldButton.frame.size.height + pad, bSize.width + fsize, bSize.height + fsize/2);
            }
            else {
                buttonRect = CGRectMake(oldButton.frame.origin.x + pad + oldButton.frame.size.width, oldButton.frame.origin.y, bSize.width + fsize, bSize.height + fsize/2);
            }
        }
        
        
        // Create button and make magic with the UI
        // -- Set the alpha to 0, cause we're gonna' animate them at the end
        UIButton *bButton = [[UIButton alloc] initWithFrame:buttonRect];
        [bButton setTitle:bub forState:UIControlStateNormal];
        [bButton.titleLabel setFont:[UIFont systemFontOfSize:fsize]];
        bButton.titleLabel.textColor = textColor;
        bButton.backgroundColor = bgColor;
        bButton.layer.cornerRadius = (3*fsize/4);
        bButton.alpha = 0;
        
        // Give it some data and a target
        bButton.tag = xx;
        [bButton addTarget:self action:@selector(didClickBubbleButton:) forControlEvents:UIControlEventTouchUpInside];
        
        // And finally add a shadow
        bButton.layer.shadowColor = [[UIColor blackColor] CGColor];
        bButton.layer.shadowOffset = CGSizeMake(0.0f, 2.5f);
        bButton.layer.shadowRadius = 5.0f;
        bButton.layer.shadowOpacity = 0.35f;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bButton.bounds cornerRadius:(3*fsize/4)];
        bButton.layer.shadowPath = [path CGPath];
        
        // Add to the view, and to the array
        [bubbleView addSubview:bButton];
        [bubbleButtonArray addObject:bButton];
        
        // Peace.
        [bButton release];
    }
    
    // Sequentially animate the buttons appearing in view
    // -- This is the interval between each button animating, not overall span
    // -- I recommend 0.034 for an aesthetic, smooth transition
    [self addBubbleButtonsWithInterval:0.034];
}



-(void)addBubbleButtonsWithInterval:(float)ftime {
    // Make sure there are buttons to animate
    // Take the first button in the array, animate alpha to 1
    // Remove button from array
    // Recur. Lather, rinse, repeat until all are buttons are on screen
    
    if (bubbleButtonArray.count > 0) {
        UIButton *button = [bubbleButtonArray objectAtIndex:0];
        [UIView animateWithDuration:ftime animations:^{
            button.alpha = 1;
        } completion:^(BOOL fin){
            [bubbleButtonArray removeObjectAtIndex:0];
            [self addBubbleButtonsWithInterval:ftime];
        }];
    }
}



-(void)removeBubbleButtonsWithInterval:(float)ftime {
    // Make sure there are buttons on screen to animate
    // Take the last button on screen, animate alpha to 0
    // Remove button from superview
    // Recur. Lather, rinse, repeat until all buttons are off screen
    
    if (bubbleView.subviews.count > 0){
        UIButton *button = [bubbleView.subviews objectAtIndex:bubbleView.subviews.count - 1];
        [UIView animateWithDuration:ftime animations:^{
            button.alpha = 0;
        } completion:^(BOOL fin){
            if (bubbleView.subviews.count > 0) {
                [[bubbleView.subviews objectAtIndex:bubbleView.subviews.count - 1] removeFromSuperview];
                [self removeBubbleButtonsWithInterval:ftime];
            }
        }];
    }
}



-(void)didClickBubbleButton:(UIButton *)bubble {
    // Do something here
    // Use bubble.tag to access your data
    // -- or bubble.titleLabel.text to access the string
    // -- etc.
    
    // Removing all buttons for demo purposes
    [self removeBubbleButtonsWithInterval:0.034];
}


#pragma mark - IBAction for DEMO

- (IBAction)addButtons:(id)sender {
    // I'm just creating an array for demo purposes here.
    // -- These will serve as my bubble buttons
    NSArray *bubbleStringArray = @[@"hello", @"this", @"is", @"a", @"test", @"of", @"the", @"BubbleButtonView", @"class"];
    
    // Create colors for buttons
    UIColor *textColor = [UIColor darkGrayColor];
    UIColor *bgColor = [UIColor whiteColor];
    
    // Now make them sucka's.
    [self fillBubbleViewWithButtons:bubbleStringArray bgColor:bgColor textColor:textColor fontSize:14];
}


#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [bubbleView release];
    [super dealloc];
}

@end
