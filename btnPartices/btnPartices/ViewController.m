//
//  ViewController.m
//  btnPartices
//
//  Created by mac on 14-6-21.
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
    
    [self createRect];
    [self createBtn:@"sub_black_prev" highLight:@"sub_blue_prev" point:CGPointMake(10, 360) action:@selector(toLeft)];
    [self createBtn:@"sub_black_next" highLight:@"sub_blue_next" point:CGPointMake(80, 360) action:@selector(toRight)];
    [self createBtn:@"sub_black_up" highLight:@"sub_blue_up" point:CGPointMake(47, 320) action:@selector(toUp)];
    [self createBtn:@"sub_black_down" highLight:@"sub_blue_down" point:CGPointMake(47, 400) action:@selector(toDown)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)rotateLeft
{
    _angle += 45;
    _rect.transform = CGAffineTransformMakeRotation(_angle);
}

-(IBAction)rotateRight
{
    _angle -= 45;
    _rect.transform = CGAffineTransformMakeRotation(_angle);
}

-(IBAction)addBtn
{
    CGRect pos = _rect.frame;
    
    pos.size.width *= 1.1;
    pos.size.height *= 1.1;
    
    _rect.frame = pos;
}

-(IBAction)subBtn
{
    CGRect pos = _rect.frame;
    
    pos.size.width *= 0.9;
    pos.size.height *= 0.9;
    
    _rect.frame = pos;
}

-(void)createBtn:(NSString *)normal highLight:(NSString *)high point:(CGPoint)point action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    
    
    UIImage *nImage = [UIImage imageNamed:normal];
    UIImage *hImage = [UIImage imageNamed:high];
    
    [btn setBackgroundImage:nImage forState:UIControlStateNormal];
    [btn setBackgroundImage:hImage forState:UIControlStateHighlighted];
    
    btn.frame = CGRectMake(point.x, point.y, nImage.size.width, hImage.size.height);
    
    [btn addTarget:Nil action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void)createRect
{
    UIButton *rect = [[UIButton alloc] initWithFrame:CGRectMake(60,120, 100, 100)];
    
    rect.backgroundColor = [UIColor orangeColor];
    
    [rect setTitle:@"点击我!" forState:UIControlStateNormal];
    [rect setTitle:@"被虐了!" forState:UIControlStateHighlighted];
    
    [rect setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    _rect = rect;
    
    [self.view addSubview:rect];
}

-(void)toLeft
{
    CGRect pos = _rect.frame;
    
    pos.origin.x += -5;
    
    _rect.frame = pos;
    
}

-(void)toRight
{
    CGRect pos = _rect.frame;
    
    pos.origin.x += 5;
    
    _rect.frame = pos;
}

-(void)toUp
{
    CGRect pos = _rect.frame;
    
    pos.origin.y += -5;
    
    _rect.frame = pos;
}

-(void)toDown
{
    CGRect pos = _rect.frame;
    
    pos.origin.y += 5;
    
    _rect.frame = pos;
}

@end
