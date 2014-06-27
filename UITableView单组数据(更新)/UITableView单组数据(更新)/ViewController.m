//
//  ViewController.m
//  UITableView单组数据(更新)
//
//  Created by mac on 14-6-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *infos;
@property (nonatomic,strong) NSIndexPath *selectIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _infos = [NSMutableArray array];
    
    for(int i = 0; i < kNum; i++){
        NSString *path = [NSString stringWithFormat:@"00%d.png",arc4random_uniform(8)+1];
        NSMutableDictionary *data = [NSMutableDictionary dictionaryWithObjects:@[@"123123123",[UIImage imageNamed:path]] forKeys:@[@"title",@"image"]];
        [_infos addObject:data];
    }
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
    return kNum;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    int row = indexPath.row;
    
    NSMutableDictionary *dict = _infos[row];
    cell.textLabel.text = dict[@"title"];
    cell.imageView.image = dict[@"image"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _selectIndexPath = indexPath;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"修改数据" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UITextField *textField = [alertView textFieldAtIndex:0];
    
    int row = _selectIndexPath.row;
    
    NSMutableDictionary *dict = _infos[row];
    
    dict[@"title"] = textField.text;
    
    NSLog(@"%@",_infos);
    
    [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
}
@end
