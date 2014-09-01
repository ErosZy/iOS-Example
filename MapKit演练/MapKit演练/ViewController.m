//
//  ViewController.m
//  MapKit演练
//
//  Created by mac on 14-9-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
    NSLog(@"11111111");
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"new");
    NSLog(@"%@",newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"old");
    NSLog(@"%@",locations);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
