//
//  ViewController.h
//  AFN框架使用
//
//  Created by mac on 14-7-25.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)sendGET:(id)sender;
- (IBAction)sendPOST:(id)sender;
- (IBAction)download:(id)sender;
- (IBAction)upload:(id)sender;
- (IBAction)uploadWithStream:(id)sender;
- (IBAction)netWorkReachable:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textField;

@end
