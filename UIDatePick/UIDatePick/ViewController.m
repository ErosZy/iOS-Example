//
//  ViewController.m
//  UIDatePick
//
//  Created by mac on 14-6-23.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)datePickerChanged:(UIDatePicker *)sender {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    format.dateFormat = @"YYYY-MM-dd";
    
    NSString *str = [format stringFromDate:sender.date];
    
    NSLog(@"%@",str);
}
@end
