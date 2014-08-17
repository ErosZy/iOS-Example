//
//  ViewController.m
//  基础动画-使用ActiveIndicator
//
//  Created by mac on 14-8-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.window setHidesWhenStopped:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.window.isAnimating)
    {
        [self.window stopAnimating];
    }else{
        [self.window startAnimating];
        [SVProgressHUD showWithStatus:@"请等一下!" maskType:SVProgressHUDMaskTypeBlack];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dismissSVProgress) userInfo:nil repeats:NO];
    }
}

-(void)dismissSVProgress
{
    [SVProgressHUD dismiss];
}

@end
