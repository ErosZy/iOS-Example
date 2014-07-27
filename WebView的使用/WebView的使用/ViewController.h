//
//  ViewController.h
//  WebView的使用
//
//  Created by mac on 14-7-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *viewer;
- (IBAction)loadPDF:(id)sender;
- (IBAction)loadHTML:(id)sender;

@end
