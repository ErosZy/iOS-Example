//
//  subView.m
//  Quartz2D基本使用
//
//  Created by mac on 14-8-4.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "subView.h"

@implementation subView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawImg];
}

#pragma mark - 画图
-(void)drawImg
{
    UIImage *image = [UIImage imageNamed:@"1.png"];
    [image drawAtPoint:CGPointMake(0, 0)];
    //[image drawInRect:CGRectMake(0, 0, 50, 50)];
    //[image drawAsPatternInRect:CGRectMake(0, 0, 300, 300)];
}

#pragma mark - 画字体
-(void)drawText
{
    NSString *str = @"i love u!";
    CGPoint point = CGPointMake(100, 100);
    UIFont *font = [UIFont fontWithName:@"Geeza Pro" size:22];
    [str drawAtPoint:point withFont:font];
}

#pragma mark - 画圆弧
-(void)drawArc
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, 100, 100, 50, 0, M_PI_2, 0);
    CGContextStrokePath(context);
}

#pragma mark - 画曲线
-(void)drawCurve
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 50);
    CGContextAddCurveToPoint(context, 50, 50, 100, 100, 100, 200);
    CGContextStrokePath(context);
}

#pragma mark - 画矩形
-(void)drawRectangle
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextStrokeRect(context, CGRectMake(100, 100, 100, 100));
}

#pragma mark - 画圆
-(void)drawCircle
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(150, 150, 100, 100));
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextStrokePath(context);
}

#pragma mark - 画直线 使用context
-(void)drawLine1
{
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 100, 50);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 50, 100);
    CGContextAddLineToPoint(context, 50,50);
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextSetLineWidth(context, 2);
    
    //stroke或fill都是内部调用了closePath进行路径的闭合
    CGContextDrawPath(context, kCGPathStroke);
    //CGContextStrokePath(context);
    //CGContextClosePath(context);
}

#pragma mark - 画直线 使用path
-(void)drawLine2
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path =  CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 50,50);
    CGPathAddLineToPoint(path, NULL, 100, 50);
    CGPathAddLineToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 50, 100);
    CGPathAddLineToPoint(path, NULL, 50, 50);
    
    CGContextAddPath(context, path);
    
    CGContextSetLineWidth(context, 10);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}

@end
