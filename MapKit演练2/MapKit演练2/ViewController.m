//
//  ViewController.m
//  MapKit演练2
//
//  Created by mac on 14-9-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"
#import "MapPoint.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MKMapView *mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    mapView.centerCoordinate = CLLocationCoordinate2DMake(20, 100);
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%@",userLocation.location);
    mapView.centerCoordinate = userLocation.location.coordinate;
    
    MapPoint *point = [[MapPoint alloc] initWith:userLocation.location.coordinate withTitle:userLocation.title AndSubTitle:userLocation.subtitle];
    [mapView addAnnotation:point];
}

@end
