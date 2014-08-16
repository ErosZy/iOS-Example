//
//  ViewController.m
//  CALayer创建自己的layer
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
    CALayer *subLayer = [CALayer layer];
    
    [subLayer setBounds:CGRectMake(0, 0, 50, 50)];
    [subLayer setAnchorPoint:CGPointMake(0, 0)];
    [subLayer setBorderColor:[[UIColor greenColor] CGColor]];
    [subLayer setBorderWidth:5];
    
    UIImage *image = [UIImage imageNamed:@"1.gif"];;
    [subLayer setContents:(id)[image CGImage]];
    [subLayer setCornerRadius:20];
    [subLayer setMasksToBounds:YES];
    
    [self.view.layer addSublayer:subLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
