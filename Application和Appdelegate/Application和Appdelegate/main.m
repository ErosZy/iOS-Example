//
//  main.m
//  Application和Appdelegate
//
//  Created by mac on 14-7-2.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

//整个程序的入口
int main(int argc, char * argv[])
{
    @autoreleasepool {
        //UIApplication是整个程序的入口
        NSString *app = NSStringFromClass([UIApplication class]);
        //Appdelegate是用来响应整个程序的事件，相当于代理
        NSString *delegate = NSStringFromClass([AppDelegate class]);
        //UIApplicationMain函数会执行一个循环，只有在程序crash等情况下才会进行值返回
        return UIApplicationMain(argc, argv, app, delegate);
    }
}
