//
//  addUserViewController.m
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "addUserViewController.h"
#import "Person.h"

@interface addUserViewController ()

@end

@implementation addUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setDelegate:(id<addUserViewControllerDelegate>) viewDelegate
{
    _viewDeleate = viewDelegate;
}

- (IBAction)addUser:(id)sender {
    Person *p = [[Person alloc] init];
    p.username = self.username.text;
    p.age = [self.age.text intValue];
    
    [_viewDeleate reload:self userInfo:p];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
