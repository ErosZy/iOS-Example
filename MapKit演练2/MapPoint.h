//
//  MapPoint.h
//  MapKit演练2
//
//  Created by mac on 14-9-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject<MKAnnotation>

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

-(id)initWith:(CLLocationCoordinate2D)coordinate withTitle:(NSString *)title AndSubTitle:(NSString *)subTitle;

@end
