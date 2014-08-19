//
//  ViewController.m
//  核心动画 - 关键帧动画
//
//  Created by mac on 14-8-18.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *demoView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    demoView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:demoView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    NSValue *p0 = [NSValue valueWithCGPoint:CGPointMake(20, 20)];
//    NSValue *p1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    NSValue *p2 = [NSValue valueWithCGPoint:CGPointMake(300, 90)];
//    
//    NSArray *array = @[p0,p1,p2];
//    
//    [keyAnim setValues:array];
//    [keyAnim setDuration:1];
//    
//    [demoView.layer addAnimation:keyAnim forKey:nil];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 100)];
    [anim setPath:[path CGPath]];
    [anim setDuration:1.0];
    [anim setRemovedOnCompletion:NO];
    [anim setFillMode:kCAFillModeForwards];
    
    [demoView.layer addAnimation:anim forKey:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
