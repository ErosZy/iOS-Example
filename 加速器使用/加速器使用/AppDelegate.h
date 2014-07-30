//
//  AppDelegate.h
//  加速器使用
//
//  Created by mac on 14-7-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong,readonly) CMMotionManager *sharedMotionManager;

@end
