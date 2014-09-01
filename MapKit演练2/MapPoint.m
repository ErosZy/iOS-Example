//
//  MapPoint.m
//  MapKit演练2
//
//  Created by mac on 14-9-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

-(id)initWith:(CLLocationCoordinate2D)coordinate withTitle:(NSString *)title AndSubTitle:(NSString *)subTitle
{
    if(self = [super init]){
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = title;
    }
    return self;
}

@end
