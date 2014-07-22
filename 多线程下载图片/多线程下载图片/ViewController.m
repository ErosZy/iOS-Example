//
//  ViewController.m
//  多线程下载图片
//
//  Created by mac on 14-7-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *resourses;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *bPath = [bundle pathForResource:@"pictures" ofType:@"bundle"];
    NSBundle *bBundle = [[NSBundle alloc] initWithPath:bPath];
    _resourses = [bBundle pathsForResourcesOfType:@"jpg" inDirectory:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)downloadPicture:(id)sender
{
    int index = [sender intValue];
    [NSThread sleepForTimeInterval:index];
    NSString *path = _resourses[index];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    UIImageView *imageView = self.imageViews[index];
    imageView.image = image;
    
}

- (IBAction)download:(id)sender {
    for(int i = 0; i < _resourses.count; i++){
        [NSThread detachNewThreadSelector:@selector(downloadPicture:) toTarget:self withObject:[NSNumber numberWithInt:i] ];
    }
}
@end
