//
//  ViewController.h
//  photoAblum
//
//  Created by mac on 14-6-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *processLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgContainer;
@property (weak, nonatomic) IBOutlet UILabel *imgInfoLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;

- (IBAction)switchPress:(UISwitch *)sender;
- (IBAction)sliderChanged:(UISlider *)sender;
- (IBAction)stepperChanged:(UIStepper *)sender;

@end
