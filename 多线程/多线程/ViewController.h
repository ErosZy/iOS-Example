//
//  ViewController.h
//  多线程
//
//  Created by mac on 14-7-21.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)startNSThread:(id)sender;
- (IBAction)startInvocation:(id)sender;
- (IBAction)startBlock:(id)sender;
- (IBAction)startGCD:(id)sender;

@end
