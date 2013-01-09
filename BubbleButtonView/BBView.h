//
//  BBView.h
//  BubbleButtonView
//
//  Created by Benjamin Gordon on 1/8/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBView : UIView

@property (nonatomic, retain) NSMutableArray *bubbleButtonArray;


-(void)fillBubbleViewWithButtons:(NSArray *)strings bgColor:(UIColor *)bgColor textColor:(UIColor *)textColor fontSize:(float)fsize;
-(void)addBubbleButtonsWithInterval:(float)ftime;
-(void)removeBubbleButtonsWithInterval:(float)ftime;
-(void)didClickBubbleButton:(UIButton *)bubble;

@end
