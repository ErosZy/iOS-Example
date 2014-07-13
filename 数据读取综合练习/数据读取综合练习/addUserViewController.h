//
//  addUserViewController.h
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@protocol addUserViewControllerDelegate <NSObject>

-(void)reload:(UIViewController *)addUserViewController userInfo:(Person *)p;

@end



@interface addUserViewController : UIViewController

@property  (nonatomic,weak) id viewDeleate;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *age;

-(void)setDelegate:(id<addUserViewControllerDelegate>) viewDelegate;

- (IBAction)addUser:(id)sender;

@end
