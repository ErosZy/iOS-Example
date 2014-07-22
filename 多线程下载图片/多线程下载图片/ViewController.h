//
//  ViewController.h
//  多线程下载图片
//
//  Created by mac on 14-7-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;
- (IBAction)download:(id)sender;

@end
