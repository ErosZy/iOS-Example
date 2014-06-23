//
//  ViewController.h
//  linkman
//
//  Created by mac on 14-6-23.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *removeBtn;
-(IBAction)addRow:(id)sender;
-(IBAction)removeRow:(id)sender;
-(IBAction)showTitle:(id)sender;
@end
