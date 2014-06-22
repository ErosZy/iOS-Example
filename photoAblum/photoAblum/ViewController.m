//
//  ViewController.m
//  photoAblum
//
//  Created by mac on 14-6-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) NSArray *imgInfos;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //加载plist列表资源
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"images" ofType:@"plist"];
    _imgInfos = [NSArray arrayWithContentsOfFile:path];
    
    int count = _imgInfos.count;
    
    //初始化slider信息
    self.slider.maximumValue = count;
    self.slider.minimumValue = 1;
    
    //初始化processLabel信息
    self.processLabel.text = [NSString stringWithFormat:@"1/%d",count];
    
    //初始化stepper信息
    self.stepper.maximumValue = count;
    self.stepper.minimumValue = 1;
    self.stepper.stepValue = 1;
    
    //初始化第一张图的显示和其文案
    NSDictionary *dict = _imgInfos[0];
    self.imgInfoLabel.text = dict[@"title"];
    self.imgContainer.image = [UIImage imageNamed:dict[@"icon"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchPress:(UISwitch *)sender {
    if(sender.isOn){
        self.view.backgroundColor = [UIColor grayColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)sliderChanged:(UISlider *)sender {
    int value = (int)sender.value - 1;
    NSDictionary *dict = _imgInfos[value];
    self.imgInfoLabel.text = dict[@"title"];
    self.imgContainer.image = [UIImage imageNamed:dict[@"icon"]];
    self.processLabel.text = [NSString stringWithFormat:@"%d/%d",value + 1,_imgInfos.count];
    self.stepper.value = value + 1;
}

- (IBAction)stepperChanged:(UIStepper *)sender {
    int value = (int)sender.value - 1;
    NSDictionary *dict = _imgInfos[value];
    self.imgInfoLabel.text = dict[@"title"];
    self.imgContainer.image = [UIImage imageNamed:dict[@"icon"]];
    self.processLabel.text = [NSString stringWithFormat:@"%d/%d",value + 1,_imgInfos.count];
    self.slider.value = value + 1;
}
@end
