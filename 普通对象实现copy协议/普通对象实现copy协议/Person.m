//
//  Person.m
//  普通对象实现copy协议
//
//  Created by mac on 14-7-10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

//copy会调用copyWithZone:方法
-(id)copyWithZone:(NSZone *)zone
{
    // 这里获取Class是为了子类调用[super copyWithZone:]
    // 这样的话，就没有耦合了
    Class c = [self class];
    Person *p = [[c allocWithZone:zone] init];
    return p;
}

@end
