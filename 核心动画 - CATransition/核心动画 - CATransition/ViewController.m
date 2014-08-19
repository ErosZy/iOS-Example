//
//  ViewController.m
//  核心动画 - CATransition
//
//  Created by mac on 14-8-19.
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
    
    demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:demoView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CATransition *t = [[CATransition alloc] init];
    [t setType:kCATransitionFade];
    [t setSubtype:kCATransitionFromRight];
    [t setDuration:1.0];
    [demoView.layer addAnimation:t forKey:nil];
    
    demoView.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
