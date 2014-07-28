//
//  ViewController.m
//  手势识别演练
//
//  Created by mac on 14-7-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *subView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.subView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 50, 50)];
    [self.subView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.subView];
    
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateAction:)];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    

    [self.view addGestureRecognizer:swipe];
    [self.subView addGestureRecognizer:longPress];
    [self.view addGestureRecognizer:rotate];
    [self.view addGestureRecognizer:pinch];
    [self.subView addGestureRecognizer:tap];
    [self.subView addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 扫手势
-(void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            self.subView.backgroundColor = [UIColor blueColor];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            break;
        case UISwipeGestureRecognizerDirectionDown:
            break;
        case UISwipeGestureRecognizerDirectionUp:
            break;
        default:
            break;
    }
}

#pragma mark - 长按手势
-(void)longPressAction:(UILongPressGestureRecognizer *)longPress
{
    if(longPress.state == UIGestureRecognizerStateBegan){
        NSLog(@"begin");
    }else if(longPress.state == UIGestureRecognizerStateEnded){
        NSLog(@"end");
    }
}

#pragma mark - 旋转手势
-(void)rotateAction:(UIRotationGestureRecognizer *)rotate
{
    //self.subView.transform = CGAffineTransformMakeRotation(rotate.rotation);
    
    self.subView.transform = CGAffineTransformRotate(self.subView.transform, rotate.rotation);
    rotate.rotation = 0.0f;
}

#pragma mark - 捏合手势
-(void)pinchAction:(UIPinchGestureRecognizer *)pinch
{
    //self.subView.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale);
    
    self.subView.transform = CGAffineTransformScale(self.subView.transform, pinch.scale, pinch.scale);
    pinch.scale = 0.0f;
}

#pragma mark - 点按手势
-(void)tapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"touched");
}

#pragma mark - 拖拽手势
-(void)panAction:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan locationInView:self.view];
    //NSLog(@"%@",NSStringFromCGPoint(point));
    self.subView.center = point;
}


@end
