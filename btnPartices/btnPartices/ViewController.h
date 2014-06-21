//
//  ViewController.h
//  btnPartices
//
//  Created by mac on 14-6-21.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak,nonatomic) UIButton *rect;
@property (nonatomic,assign) CGFloat angle;

-(IBAction)rotateLeft;
-(IBAction)rotateRight;
-(IBAction)addBtn;
-(IBAction)subBtn;

-(void) createRect;

-(void)createBtn:(NSString *)normal highLight:(NSString *)high point:(CGPoint)point action:(SEL)action;

-(void)toLeft;

-(void)toRight;

-(void)toUp;

-(void)toDown;

@end
