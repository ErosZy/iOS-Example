//
//  ViewController.h
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addUserViewController.h"
#import "userDetailInfoViewController.h"

static const CGFloat kRowHeight = 77;

@interface ViewController : UITableViewController<addUserViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)saveUserInfos:(id)sender;
@end
