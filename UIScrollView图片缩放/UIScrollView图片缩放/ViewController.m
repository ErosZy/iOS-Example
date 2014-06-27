//
//  ViewController.m
//  UIScrollView图片缩放
//
//  Created by mac on 14-6-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"ipad"];
    
    _imageView = [[UIImageView alloc] initWithImage:image];
    
    self.scroller.contentSize = image.size;
    
    self.scroller.maximumZoomScale = 2;
    self.scroller.minimumZoomScale = 0.5;
    
    [self.scroller addSubview:_imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"%f",scale);
}
@end
