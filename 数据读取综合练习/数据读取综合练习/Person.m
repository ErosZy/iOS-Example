//
//  Person.m
//  数据读取综合练习
//
//  Created by mac on 14-7-13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self.username = [aDecoder decodeObjectForKey:@"username"];
    self.age = [aDecoder decodeIntegerForKey:@"age"];
    
    return self;
}

@end
