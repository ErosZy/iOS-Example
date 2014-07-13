//
//  Person.h
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic,copy) NSString *username;
@property (nonatomic,assign) int age;

@end
