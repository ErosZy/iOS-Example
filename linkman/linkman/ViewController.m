//
//  ViewController.m
//  linkman
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
    
     self.removeBtn.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addRow:(id)sender
{
    UIView *subView = [[UIView alloc] init];
    UIView *lastChild = [self.view.subviews lastObject];
    
    CGFloat width = lastChild.frame.size.width;
    CGFloat height = lastChild.frame.size.height;
    CGFloat y = lastChild.frame.origin.y;
    
    subView.frame = CGRectMake(width, y+height+1, width, 70);
    subView.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 0, 70, 70);
    
    int num = arc4random_uniform(8);
    NSString *path = [NSString stringWithFormat:@"%d.png",num];
    UIImage *img = [UIImage imageNamed:path];
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(showTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 0, 200, 70);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"aaaaaaa";
    label.tag = 10;
    
    [subView addSubview:btn];
    [subView addSubview:label];
    [self.view addSubview:subView];
    
    [UIView beginAnimations:nil context:nil];
    
    CGRect rect = subView.frame;
    rect.origin.x = 0;
    subView.frame = rect;
    
    [UIView commitAnimations];
    
    self.removeBtn.enabled = YES;
}

-(void)removeRow:(id)sender
{
    NSArray *subViews = self.view.subviews;
    int count = subViews.count;
    UIView *lastChild = subViews.lastObject;
    CGFloat width = self.view.frame.size.width;
    
    if(count > 1){
        [UIView animateWithDuration:0.25 animations:^{
            CGRect rect = lastChild.frame;
            rect.origin.x = width;
            lastChild.frame = rect;
        } completion:^(BOOL finished) {
            [lastChild removeFromSuperview];
        }];
    }
    
    self.removeBtn.enabled = count > 1;
}

-(void) showTitle:(id)sender
{
    UIView *subView = [sender superview];
    UILabel *label = (UILabel *)[subView viewWithTag:10];
    NSString *str = label.text;
    NSLog(@"%@",str);
}

@end
