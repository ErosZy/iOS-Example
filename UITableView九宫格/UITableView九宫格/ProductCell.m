//
//  ProductCell.m
//  UITableView九宫格
//
//  Created by mac on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ProductCell.h"
#import "BookButtonItem.h"

@implementation ProductCell

-(void)setCellData:(NSArray *)data
{
    int len = data.count;
    
    for(int i = 0; i < len; i++){
        double x = i * 80;
        double y = 0;
        double width = 70;
        double height = 70;
        BookButtonItem *item = [[BookButtonItem alloc] initWithFrame:CGRectMake(x, y, width, height)];
        [item setTitle:data[i][@"title"] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:data[i][@"image"]] forState:UIControlStateNormal];
        [self addSubview:item];
    }
}

@end
