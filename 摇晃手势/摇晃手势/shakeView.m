//
//  shakeView.m
//  摇晃手势
//
//  Created by mac on 14-7-28.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "shakeView.h"

@implementation shakeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(BOOL)becomeFirstResponder
{
    return YES;
}

@end
