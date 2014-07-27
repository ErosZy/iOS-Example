//
//  ViewController.m
//  UITouch使用
//
//  Created by mac on 14-7-27.
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
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 50, 50)];
    subView.backgroundColor = [UIColor redColor];
    [self.view addSubview:subView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(touches.count == 1){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        NSArray *subViews = [self.view subviews];
        UIView *subView = subViews[2];
        subView.center = point;
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(touches.count == 1){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        NSArray *subViews = [self.view subviews];
        UIView *subView = subViews[2];
        subView.center = point;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸中断");
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}

@end
