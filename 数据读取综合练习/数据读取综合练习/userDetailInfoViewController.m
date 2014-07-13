//
//  userDetailInfoViewController.m
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "userDetailInfoViewController.h"
#import "Person.h"

@interface userDetailInfoViewController ()

@end

@implementation userDetailInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.username.text = self.p.username;
    self.age.text = [NSString stringWithFormat:@"%d岁",self.p.age];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
