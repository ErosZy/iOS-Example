//
//  ViewController.m
//  基本动画：序列帧动画
//
//  Created by mac on 14-8-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic) NSMutableArray *images;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.images = [NSMutableArray array];
    for(int i = 1; i <= 10; i++){
        NSString *path = [NSString stringWithFormat:@"/images.bundle/zy/%d.png",i];
        UIImage *image = [UIImage imageNamed:path];
        [self.images addObject:image];
    }
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setAnimationImages:self.images];
    [imageView setAnimationRepeatCount:MAXFLOAT];
    [imageView setAnimationDuration:1.0f];
    [imageView startAnimating];
    imageView.frame = CGRectMake(100, 200, 200, 200);
    
    [self.view addSubview:imageView];
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(logSth)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)logSth
{
    NSLog(@"start");
}

@end
