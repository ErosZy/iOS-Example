//
//  ViewController.m
//  UITableView的简单设置
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
    
    //取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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
    return kCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = @"test!";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取选中的行
    NSLog(@"%@",[tableView indexPathForSelectedRow]);
    NSLog(@"%@",[tableView indexPathsForSelectedRows]);
    
    //根据位置得到行
    NSLog(@"%@",[tableView indexPathForRowAtPoint:CGPointMake(0, 0)]);
}

@end
