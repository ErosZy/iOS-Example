//
//  userDetailInfoViewController.h
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface userDetailInfoViewController : UIViewController

@property (strong,nonatomic) Person *p;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *age;

@end
