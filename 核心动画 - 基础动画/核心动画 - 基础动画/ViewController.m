//
//  ViewController.m
//  核心动画 - 基础动画
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
    
    UIScreen *screen = [UIScreen mainScreen];
    CGRect rect = [screen applicationFrame];
    demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width/10, rect.size.height/10)];
    demoView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:demoView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    [anim setFromValue:[NSValue valueWithCGPoint:CGPointMake(0, 0)]];
    [anim setToValue:[NSValue valueWithCGPoint:p]];
    [anim setDuration:1];
    [anim setFillMode:kCAFillModeForwards];
    [anim setRemovedOnCompletion:NO];
    [anim setDelegate:self];
    [demoView.layer addAnimation:anim forKey:nil];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@",NSStringFromCGPoint(demoView.center));
    NSLog(@"动画结束");
}

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"动画开始");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
