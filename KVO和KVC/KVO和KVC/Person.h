//
//  Person.h
//  KVO和KVC
//
//  Created by mac on 14-7-3.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSURLConnectionDataDelegate>
{
    @private
    NSString *_school;
}

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;

-(id)initWithName:(NSString *)name andAge:(int)age;
-(void)setSchool:(NSString *)school;
-(NSString *)school;

@end
