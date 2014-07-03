//
//  AppDelegate.m
//  传统xib的加载
//
//  Created by mac on 14-7-2.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    /**
     * 1.视图遵循，什么时候使用什么时候加载
     * 2.在调用view的时候会调用UIViewController的loadView方法，其方法遵循
     *   2.1> 如果nib存在，会对应的加载xib
     *   2.2> 如果nib不存在，则会首先尝试加载xxxView.xib，然后尝试加载xxxViewController.xib，最后直接调用loadView里面的生成方法
     *
     */
    ZYViewController *viewController = [[ZYViewController alloc] init];
    self.window.rootViewController = viewController;
    
    /**
     * 每个app都会有一个对应的keyWindow，但是可以添加多个window
     * 但是只有唯一的一个window是有事件响应
     */
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
