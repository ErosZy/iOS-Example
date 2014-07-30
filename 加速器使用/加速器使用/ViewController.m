//
//  ViewController.m
//  加速器使用
//
//  Created by mac on 14-7-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//
#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic,strong) CMMotionManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 此方法已经被废弃
//    UIAccelerometer *acc = [UIAccelerometer sharedAccelerometer];
//    acc.updateInterval = 1.0 / 30.0;
//    acc.delegate = self;
    
    //self.manager = [[CMMotionManager alloc] init];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.manager = [appDelegate sharedMotionManager];
    
    if([self.manager isAccelerometerAvailable]){
        [self.manager setAccelerometerUpdateInterval:1.0/30.0];
        [self.manager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            NSLog(@"%@",accelerometerData);
        }];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
//{
//    NSLog(@"%@",acceleration);
//}

@end
