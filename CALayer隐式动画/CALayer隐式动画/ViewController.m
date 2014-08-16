//
//  ViewController.m
//  CALayer隐式动画
//
//  Created by mac on 14-8-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic) CALayer *sublayer;
@property(strong,nonatomic) NSArray *images;
@property(strong,nonatomic) NSArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.sublayer = [CALayer layer];
    self.images = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],
                                            [UIImage imageNamed:@"2.jpg"],
                                            [UIImage imageNamed:@"3.gif"],
                                            [UIImage imageNamed:@"4.jpg"], nil];
    
    self.colors = [NSArray arrayWithObjects:[UIColor yellowColor],
                                            [UIColor blackColor],
                                            [UIColor redColor],
                                            [UIColor blueColor],nil];
    
    [self.sublayer setBounds:CGRectMake(0, 0, 100, 100)];
    [self.sublayer setCornerRadius:50];
    [self.sublayer setMasksToBounds:YES];
    [self.sublayer setBorderWidth:2];
    [self.sublayer setBorderColor:[self.colors[0] CGColor]];
    //[self.sublayer setAnchorPoint:CGPointMake(0, 0)];
    [self.sublayer setContents:(id)[self.images[0] CGImage]];
    
    [self.view.layer addSublayer:self.sublayer];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    CGPoint point = [tap locationInView:self.view];
    [self.sublayer setPosition:point];
    int i = arc4random_uniform(4);
    [self.sublayer setBorderColor:[self.colors[i] CGColor]];
    //[self.sublayer setAnchorPoint:CGPointMake(0, 0)];
    [self.sublayer setContents:(id)[self.images[i] CGImage]];
}
@end
