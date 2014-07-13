//
//  ViewController.m
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *infos;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [documents[0] stringByAppendingPathComponent:@"userInfos.plist"];
    
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    if(isExist){
        self.infos = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }else{
        self.infos =  [@[] mutableCopy];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"add"]){
        addUserViewController *dest = [segue destinationViewController];
        [dest setDelegate:self];
    }else{
        userDetailInfoViewController *dest = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        int row = indexPath.row;
        dest.p = self.infos[row];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.infos.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    int row = indexPath.row;
    Person *p = self.infos[row];
    
    UILabel *username = (UILabel *)[cell viewWithTag:2];
    username.text = p.username;
    
    UILabel *age = (UILabel *)[cell viewWithTag:2];
    age.text = [NSString stringWithFormat:@"%d岁",p.age];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kRowHeight;
}

-(void)reload:(UIViewController *)addUserViewController userInfo:(Person *)p
{
    [self.infos addObject:p];
    [self.tableView reloadData];
}

- (IBAction)saveUserInfos:(id)sender {
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [documents[0] stringByAppendingPathComponent:@"userInfos.plist"];
    
    [NSKeyedArchiver archiveRootObject:self.infos toFile:path];
}
@end
