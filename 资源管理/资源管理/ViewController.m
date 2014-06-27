//
//  ViewController.m
//  资源管理
//
//  Created by mac on 14-6-27.
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
    
    //mainBundle指向了资源包
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *path = [mainBundle pathForResource:@"images" ofType:@"bundle"];
    
    //获取新的bundle
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    
    //批量加载元素
    NSArray *resources = [bundle pathsForResourcesOfType:@"png" inDirectory:nil];
    
    NSLog(@"%@",resources);
    
    //这种方式加载图片没有缓存
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:@""];
    
    //采用imageNamed的方式图片具有缓存
    UIImage *imageNamed = [UIImage imageNamed:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
