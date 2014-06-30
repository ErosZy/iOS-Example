//
//  ViewController.m
//  UITableView通过xib创建cell
//
//  Created by mac on 14-6-28.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell){
        NSBundle *mainBundle = [NSBundle mainBundle];
        cell = [mainBundle loadNibNamed:@"cellItem" owner:nil options:nil][0];
    }
    
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:10];
    UILabel *priceLabel = (UILabel *)[cell viewWithTag:11];
    UIButton *buyBtn = (UIButton *)[cell viewWithTag:12];
    UIButton *collectBtn = (UIButton *)[cell viewWithTag:13];
    
    detailLabel.text = @"天猫大特卖";
    priceLabel.text = @"$12.1";
    [buyBtn addTarget:self action:@selector(buySth) forControlEvents:UIControlEventTouchUpInside];
    [collectBtn addTarget:self action:@selector(collectSth) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)buySth
{
    NSLog(@"购买了!");
}

-(void)collectSth
{
    NSLog(@"收藏了！");
}

@end

@protocol <#protocol name#> <NSObject>

<#methods#>

@end
