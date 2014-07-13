//
//  ViewController.m
//  控制器切换Modal
//
//  Created by mac on 14-7-10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"
#import "newViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goModal:(id)sender {
    newViewController *view = [[newViewController alloc] init];
    [self presentViewController:view animated:YES completion:nil];
    
}
@end
