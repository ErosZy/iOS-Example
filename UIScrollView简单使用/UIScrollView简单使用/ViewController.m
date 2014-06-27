//
//  ViewController.m
//  UIScrollView简单使用
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
    
    UIImage *image = [UIImage imageNamed:@"ipad.png"];
    
    //使用initWithImage可以不用设置图片的大小,其默认是image的大小，且坐标在(0,0)位置
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    //需要设置显示的范围
    self.scroller.contentSize = image.size;
    
    //设置滚动的位置
    self.scroller.contentOffset = CGPointMake(100, 100);
    
    //预留的边缘
    self.scroller.contentInset = UIEdgeInsetsMake(100, 100, 100, 100);
    
    [self.scroller addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
