//
//  ViewController.m
//  Quart2D生成图片水印
//
//  Created by mac on 14-8-6.
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
    
    [self createWatermark];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createWatermark
{
    UIGraphicsBeginImageContext(CGSizeMake(320, 480));
    
    UIImage *image = [UIImage imageNamed:@"1.png"];
    [image drawAtPoint:CGPointMake(0, 0)];
    
    NSString *text = @"测试水印";
    UIFont *font = [UIFont fontWithName:@"Thonburi" size:14];
    [text drawInRect:CGRectMake(0, 170, 300, 20) withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentJustified];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(newImage);
    
    [data writeToFile:@"/Users/mac/Downloads/demo.png" atomically:YES];
    
    
}

@end
