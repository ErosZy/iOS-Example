//
//  ViewController.m
//  UIScrollerView分页
//
//  Created by mac on 14-6-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *imageResources;
@property (nonatomic,weak) UIPageControl *page;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //加载图片资源
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *path = [mainBundle pathForResource:@"pages" ofType:@"bundle"];
    
    NSBundle *bundle = [[NSBundle alloc] initWithPath:path];
    
    _imageResources = [bundle pathsForResourcesOfType:@"jpg" inDirectory:@""];
    
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width * _imageResources.count;
    
    self.scroller.contentSize = CGSizeMake(width, height);
    self.scroller.pagingEnabled = YES;
    
    for(int i = 0; i < _imageResources.count; i++){
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:_imageResources[i]];
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat x = i * self.view.frame.size.width;
        CGFloat y = 0;
        imageView.frame = CGRectMake(x, y, self.view.frame.size.width, height);
        imageView.image = image;
        
        [self.scroller addSubview:imageView];
    }
    
    UIPageControl *page = [[UIPageControl alloc] init];
    _page = page;
    
    page.numberOfPages = _imageResources.count;
    page.currentPage = 0;
    page.currentPageIndicatorTintColor = [UIColor redColor];
    page.pageIndicatorTintColor = [UIColor blackColor];
    page.center = CGPointMake(self.view.frame.size.width * 0.5, 300);
    page.bounds = CGRectMake(0, 0, 150, 50);
    [page addTarget:self action:@selector(clickPage) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:page];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = self.scroller.contentOffset.x / self.view.frame.size.width;
    _page.currentPage = index;
}

-(void)clickPage{
    CGFloat offsetX = _page.currentPage * self.view.frame.size.width;
    self.scroller.contentOffset = CGPointMake(offsetX, 0);
}

@end
