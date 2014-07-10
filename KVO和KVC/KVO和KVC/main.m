//
//  main.m
//  KVO和KVC
//
//  Created by mac on 14-7-3.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Person *p1 = [[Person alloc] initWithName:@"zy" andAge:23];
        Person *p2 = [[Person alloc] initWithName:@"zy" andAge:23];
        
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:p1];
        [arr addObject:p2];
        
        /*-----------keyPath是键值序列------------*/
        [arr setValue:@"asd" forKey:@"name"];
        //[arr setValue:@"asdasd" forKeyPath:@"name"];
        
        Person *p = arr[0];
        
        NSLog(@"%@",p.name);
    
        int (^sayHello)(NSString *) = ^(NSString *name){
            return 1;
        };
        
        NSLog(@"%d",sayHello(@"aaa"));

    }
    return 0;
}

