//
//  BBView.m
//  BubbleButtonView
//
//  Created by Benjamin Gordon on 1/8/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "BBView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BBView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Bubble Button Methods

-(void)fillBubbleViewWithButtons:(NSArray *)strings bgColor:(UIColor *)bgColor textColor:(UIColor *)textColor fontSize:(float)fsize {
    // Init array
    self.bubbleButtonArray = [@[] mutableCopy];
    
    // First check to see if there are already buttons there. If there aren't any
    // subviews to bubbleView, then add these buttons.
    
    if (self.subviews.count == 0) {
        
        // Create padding between sides of view and each button
        //  -- I recommend 10 for aesthetically pleasing results at a 14 fontSize
        int pad = 10;
        
        // Iterate over every string in the array to create the Bubble Button
        for (int xx = 0; xx < strings.count; xx++) {
            
            // Find the size of the button, turn it into a rect
            NSString *bub = [strings objectAtIndex:xx];
            CGSize bSize = [bub sizeWithFont:[UIFont systemFontOfSize:fsize] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
            CGRect buttonRect = CGRectMake(pad, pad, bSize.width + fsize, bSize.height + fsize/2);
            
            
            // if new button will fit on screen, in row:
            //   - place it
            // else:
            //   - put on next row at beginning
            if (xx > 0) {
                UIButton *oldButton = [[self subviews] objectAtIndex:self.subviews.count - 1];
                if ((oldButton.frame.origin.x + (2*pad) + oldButton.frame.size.width + bSize.width + fsize) > self.frame.size.width) {
                    buttonRect = CGRectMake(pad, oldButton.frame.origin.y + oldButton.frame.size.height + pad, bSize.width + fsize, bSize.height + fsize/2);
                }
                else {
                    buttonRect = CGRectMake(oldButton.frame.origin.x + pad + oldButton.frame.size.width, oldButton.frame.origin.y, bSize.width + fsize, bSize.height + fsize/2);
                }
            }
            
            
            // Create button and make magic with the UI
            // -- Set the alpha to 0, cause we're gonna' animate them at the end
            UIButton *bButton = [[UIButton alloc] initWithFrame:buttonRect];
            [bButton setShowsTouchWhenHighlighted:NO];
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
            [self addSubview:bButton];
            [self.bubbleButtonArray addObject:bButton];
        }
        
        // Sequentially animate the buttons appearing in view
        // -- This is the interval between each button animating, not overall span
        // -- I recommend 0.034 for an nice, smooth transition
        [self addBubbleButtonsWithInterval:0.034];
    }
    
    NSLog(@"%d", self.subviews.count);
}



-(void)addBubbleButtonsWithInterval:(float)ftime {
    // Make sure there are buttons to animate
    // Take the first button in the array, animate alpha to 1
    // Remove button from array
    // Recur. Lather, rinse, repeat until all are buttons are on screen
    
    if (self.bubbleButtonArray.count > 0) {
        UIButton *button = [self.bubbleButtonArray objectAtIndex:0];
        [UIView animateWithDuration:ftime animations:^{
            button.alpha = 1;
        } completion:^(BOOL fin){
            [self.bubbleButtonArray removeObjectAtIndex:0];
            [self addBubbleButtonsWithInterval:ftime];
        }];
    }
}



-(void)removeBubbleButtonsWithInterval:(float)ftime {
    // Make sure there are buttons on screen to animate
    // Take the last button on screen, animate alpha to 0
    // Remove button from superview
    // Recur. Lather, rinse, repeat until all buttons are off screen
    
    if (self.subviews.count > 0){
        UIButton *button = [self.subviews objectAtIndex:self.subviews.count - 1];
        [UIView animateWithDuration:ftime animations:^{
            button.alpha = 0;
        } completion:^(BOOL fin){
            if (self.subviews.count > 0) {
                [[self.subviews objectAtIndex:self.subviews.count - 1] removeFromSuperview];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
