//
//  BookButtonItem.m
//  UITableView九宫格
//
//  Created by mac on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BookButtonItem.h"

@implementation BookButtonItem

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self){
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:nil size:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect titleRect = CGRectMake(0, 40, 60, 20);
    return titleRect;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect imageRect = CGRectMake(10, 0, 40, 40);
    return imageRect;
}

-(void)click{
    NSLog(@"123123");
}
@end
