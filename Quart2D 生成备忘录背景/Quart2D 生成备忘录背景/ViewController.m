//
//  ViewController.m
//  Quart2D 生成备忘录背景
//
//  Created by mac on 14-8-6.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [self drawRectImage];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage *)drawRectImage
{
    UIGraphicsBeginImageContext(CGSizeMake(320, 41));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
    CGContextAddRect(context, CGRectMake(0, 0, 320, 40));
    CGContextFillPath(context);
    
    CGContextBeginPath(context);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, 0, 41);
    CGContextAddLineToPoint(context, 320, 41);
    CGContextSetLineWidth(context, 2);
    CGContextStrokePath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
