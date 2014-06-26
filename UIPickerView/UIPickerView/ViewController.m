//
//  ViewController.m
//  UIPickerView
//
//  Created by mac on 14-6-23.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (nonatomic,strong) NSDictionary *dict;
//@property (nonatomic,strong) NSArray *keys;

@property (nonatomic,strong) NSArray *provices;
@property (nonatomic,strong) NSArray *cities;
@property (nonatomic,assign) int selectedProviceRow;
@property (nonatomic,assign) int selectedCityRow;
@property (nonatomic,assign) int row;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    _dict = @{
//              @"BJ":@[@"昌平区",@"海淀区",@"朝阳区",@"五道口"],
//              @"CQ":@[@"重庆市"]
//              };
    
    //re:dict的allkeys方法不保证Keys的顺序
//    _keys = [_dict allKeys];
    
    _provices = @[@[@"昌平区",@"海淀区",@"朝阳区",@"五道口"],@[@"重庆市"]];
    
    _cities = @[@"北京",@"重庆"];
    
    _selectedProviceRow = 0;
    _selectedCityRow = 0;
    _row = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return _cities.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(!component){
        return _cities.count;
    }else{
        NSArray *vals = _provices[_row];
        return vals.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(!component){
        return _cities[row];
    }else{
        NSArray *vals = _provices[_row];
        return vals[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(!component){
        _selectedCityRow = row;
        _row = row;
        [pickerView reloadComponent:1];
    }else{
        _selectedProviceRow = row;
    }
    
    NSLog(@"%d---%d",_selectedCityRow,_selectedProviceRow);
}
@end
