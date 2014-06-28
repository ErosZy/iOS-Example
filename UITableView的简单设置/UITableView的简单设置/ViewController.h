//
//  ViewController.h
//  UITableView的简单设置
//
//  Created by mac on 14-6-28.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCount 15

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
