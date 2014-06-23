//
//  ViewController.m
//  linkman-xib
//
//  Created by mac on 14-6-23.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray *views;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle mainBundle];
    _views = [bundle loadNibNamed:@"linkmanListItem" owner:self options:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addItem:(UIBarButtonItem *)sender {
    UIView *viewItem = _views[0];
    UILabel *label = (UILabel *)[viewItem viewWithTag:10];
    UIButton *btn = (UIButton *)[viewItem viewWithTag:11];
    
    label.text = @"1234567890";
    int random = arc4random_uniform(8);
    NSString *path = [NSString stringWithFormat:@"%d.png",random];
    UIImage *img = [UIImage imageNamed:path];
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    
    UIView *lastChild = [self.view.subviews lastObject];
    CGFloat height = lastChild.frame.size.height;
    CGFloat y = lastChild.frame.origin.y;
    
    CGRect rect = lastChild.frame;
    rect.origin.y = y+height+1;
    viewItem.frame = rect;
    
    
    [self.view addSubview:viewItem];
}

- (IBAction)removeItem:(id)sender{
    
}

-(IBAction)btnClick:(id)sender
{
    
}
@end
