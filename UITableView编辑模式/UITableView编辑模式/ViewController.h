//
//  ViewController.h
//  UITableView编辑模式
//
//  Created by mac on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)add:(id)sender;
- (IBAction)remove:(id)sender;

@end
