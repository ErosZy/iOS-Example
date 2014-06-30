//
//  ViewController.m
//  UITableView编辑模式
//
//  Created by mac on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign) BOOL isEditing;
@property (nonatomic,assign) UITableViewCellEditingStyle edtingStyle;
@property (nonatomic,strong) NSMutableArray *mutableData;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isEditing = NO;
    self.mutableData = [NSMutableArray array];
    int number = 0;
    for(int i = 0; i < 30; i++){
        [self.mutableData addObject:[NSString stringWithFormat:@"abcdefg%d",number++]];
    }
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
    return self.mutableData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.mutableData[indexPath.row];
    cell.detailTextLabel.text = @"detailText";
    
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.edtingStyle;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.mutableData removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }else{
        [self.mutableData insertObject:@"abcdwdasd" atIndex:indexPath.row];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.mutableData insertObject:self.mutableData[sourceIndexPath.row] atIndex:destinationIndexPath.row+1];
    [self.mutableData removeObjectAtIndex:sourceIndexPath.row];
}

- (IBAction)add:(id)sender {
    self.isEditing = !self.isEditing;
    self.edtingStyle = UITableViewCellEditingStyleInsert;
    [self.tableView setEditing:self.isEditing animated:YES];
}

- (IBAction)remove:(id)sender {
    self.isEditing = !self.isEditing;
    self.edtingStyle = UITableViewCellEditingStyleDelete;
    [self.tableView setEditing:self.isEditing animated:YES];
}
@end
