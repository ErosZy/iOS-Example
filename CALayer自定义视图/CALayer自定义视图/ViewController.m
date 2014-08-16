//
//  ViewController.m
//  CALayer自定义视图
//
//  Created by mac on 14-8-16.
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
    
    CALayer *sublayer = [CALayer layer];
    [sublayer setBounds:CGRectMake(0, 0, 50, 50)];
    [sublayer setDelegate:self];
    [sublayer setNeedsDisplay];
    [self.view.layer addSublayer:sublayer];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextBeginPath(ctx);
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillRect(ctx, CGRectMake(0, 0, 50, 50));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
