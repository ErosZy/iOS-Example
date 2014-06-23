//
//  ViewController.h
//  linkman-xib
//
//  Created by mac on 14-6-23.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trashBtn;
- (IBAction)addItem:(UIBarButtonItem *)sender;
- (IBAction)removeItem:(id)sender;
- (IBAction)btnClick:(id)sender;

@end
