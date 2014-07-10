//
//  Person.m
//  @property和copy
//
//  Created by mac on 14-7-10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

//@property的copy相当于生成了如下的set方法
-(void)setSchool:(NSString *)school
{
    if(_school != school)
    {
        [_school release];
        _school = [school copy];
    }
}

-(NSString *)school
{
    return _school;
}

-(void)dealloc
{
    [_school release];
    [super dealloc];
}

@end
