//
//  ViewController.m
//  CALayer基础使用
//
//  Created by mac on 14-8-16.
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
    self.view.backgroundColor = [UIColor grayColor];
    
    //设置transform属性
//    _image.layer.transform = CATransform3DMakeScale(2,2,1);
//    [_image.layer setValue:@M_PI_2 forKeyPath:@"transform.rotation"];
    
    //设置raidus
//    [_image.layer setCornerRadius:50];
//    [_image.layer setMasksToBounds:YES];
    
    //设置border
    [_image.layer setBorderWidth:2.0];
    [_image.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    //设置shadown
    [_image.layer setShadowColor:[[UIColor greenColor] CGColor]];
    [_image.layer setShadowOpacity:0.7];
    [_image.layer setShadowOffset:CGSizeMake(40, 40)];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
