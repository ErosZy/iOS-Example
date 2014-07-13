//
//  newViewController.m
//  控制器切换Modal
//
//  Created by mac on 14-7-10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "newViewController.h"

@implementation newViewController

-(void)loadView
{
    //为什么storyboard的失效了呢？
    //因为初始化控制器使用了loadView方法！
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    self.view = view;
}

-(void)viewDidLoad
{
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"111111" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(goBack2) forControlEvents:UIControlEventTouchUpInside];
    //self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"complete");
    }];
}

-(void)goBack2
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
