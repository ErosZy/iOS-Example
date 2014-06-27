//
//  ViewController.m
//  UIPickerView显示复杂内容
//
//  Created by mac on 14-6-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *flags;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _flags = @[
               @"agt.gif",
               @"baxi.gif",
               @"deguo.gif"
               ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSLog(@"%d",_flags.count);
    return _flags.count;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *path = [NSString stringWithFormat:@"guoqi.bundle/%@",_flags[row]];
    UIImage *image = [UIImage imageNamed:path];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(0, 0, 100, 60);
    imgView.image = image;
    
    UIView *subView = [[UIView alloc] init];
    subView.frame = CGRectMake(0, 0, 100, 60);
    [subView addSubview:imgView];
    
    return subView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

@end
