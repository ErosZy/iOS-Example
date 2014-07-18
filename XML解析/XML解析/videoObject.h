//
//  videoObject.h
//  XML解析
//
//  Created by mac on 14-7-18.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface videoObject : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *length;
@property (nonatomic,copy) NSString *videoURL;
@property (nonatomic,copy) NSString *imageURL;
@property (nonatomic,copy) NSString *des;
@property (nonatomic,copy) NSString *teacher;

@end
