//
//  ViewController.m
//  UITableView多组数据
//
//  Created by mac on 14-6-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *provices;
@property (nonatomic,strong) NSArray *cities;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _cities = @[@"北京",@"重庆"];
    _provices = @[@[@"昌平区",@"海淀区"],@[@"重庆市"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _cities.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *provice = _provices[section];
    return provice.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    int row = indexPath.row;
    int section = indexPath.section;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_provices[section][row]];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _cities[section];
}

@end
