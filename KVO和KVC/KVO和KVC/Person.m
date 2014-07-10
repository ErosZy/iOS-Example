//
//  Person.m
//  KVO和KVC
//
//  Created by mac on 14-7-3.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name andAge:(int)age
{
    self = [super init];
    
    if(self){
        self.name = name;
        self.age = age;
    }
    
    return self;
}

-(void)setSchool:(NSString *)school
{
    _school = school;
}

-(NSString *)school
{
    return _school;
}

@end
