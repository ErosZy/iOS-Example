//
//  main.m
//  copy关键字
//
//  Created by mac on 14-7-10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        /**
         * copy有两种情况
         * 1.不可变(NSString/NSArray/NSDictionary) --> 不可变(NSString/NSArray/NSDictionary) 相当于retain操作
         * 2.可变(NSMutable*) --> 不可变 相当于浅复制
         * 3.可变(NSMutable*) --> 可变 相当于浅复制
         */
        
        NSString *str = @"123";
        NSString *strCopy = [str copy];
        NSLog(@"%d",str == strCopy); // 结果1，说明str和strCopy地址相同
        
        NSMutableString *mString = [NSMutableString stringWithString:@"123"];
        NSString *mStringCopy = [mString copy];
        NSLog(@"%d",mString == mStringCopy); //结果0，表示地址不同
        NSLog(@"%d",[mStringCopy isEqualToString:mString]);//结果1，表示值相同，说明浅复制
        
        NSMutableString *mString2 = [NSMutableString stringWithString:@"123"];
        NSMutableString *mString2Copy = [mString2 copy];
        NSLog(@"%d",mString2 == mString2Copy);//结果0，表示地址不同
        NSLog(@"%d",[mString2 isEqualToString:mString2Copy]);//结果1，表示值相同，说明浅复制
    }
    return 0;
}

