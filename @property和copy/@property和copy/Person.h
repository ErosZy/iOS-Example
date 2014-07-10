//
//  Person.h
//  @property和copy
//
//  Created by mac on 14-7-10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_school;
}

@property (nonatomic,copy) NSString *name;

-(void)setSchool:(NSString *)school;
-(NSString *)school;

@end
