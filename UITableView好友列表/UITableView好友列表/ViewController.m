//
//  ViewController.m
//  UITableView好友列表
//
//  Created by mac on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *friends;
@property (nonatomic,strong) NSMutableArray *sections;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.sections = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"friends" ofType:@"plist"];
    self.friends = [[NSArray alloc] initWithContentsOfFile:path];
    
    for(int i = 0; i < self.friends.count; i++){
        [self.sections addObject:@0];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friends.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = self.friends[section];
    NSArray *friendsData = dict[@"friends"];
    
    if([self.sections[section] integerValue])
    {
        return friendsData.count;
    }else{
        return 0;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = self.friends[section];
    return dict[@"group"];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    btn.frame = CGRectMake(0, 0, width, 40);
    [btn setTitle:self.friends[section][@"group"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 100+section;
    
    return btn;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    int row = indexPath.row;
    int section = indexPath.section;
    NSDictionary *dict = self.friends[section];
    NSArray *friendsData = dict[@"friends"];
    cell.textLabel.text = friendsData[row];
    cell.detailTextLabel.text = @"正在输入中...";
    cell.editingAccessoryType = UITableViewCellAccessoryDetailButton;
    
    return cell;
}

-(void)click:(UIButton *)sender
{
    int index = sender.tag - 100;
    int flag = [self.sections[index] integerValue];
    NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:index];
    self.sections[index] = @(!flag);
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}



@end
