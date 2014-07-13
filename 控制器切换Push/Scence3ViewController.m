//
//  Scence3ViewController.m
//  控制器切换Push
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "Scence3ViewController.h"

@interface Scence3ViewController ()

@end

@implementation Scence3ViewController

-(void)loadView
{
    UIApplication *app = [UIApplication sharedApplication];
    UIWindow *win = [app keyWindow];
    UIScreen *screen = win.screen;
    CGRect bounds = screen.bounds;
    self.view = [[UIView alloc] initWithFrame:bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"scence3";
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(goBackScence1)];
    self.navigationItem.leftBarButtonItem = backBtn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goBackScence1
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
