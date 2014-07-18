//
//  ViewController.m
//  JSON解析
//
//  Created by mac on 14-7-18.
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
    
    NSString *jsonStr = @"{\"name\":\"zy\",\"age\":21}";
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",jsonObj);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
