//
//  ViewController.m
//  WebView的使用
//
//  Created by mac on 14-7-27.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)getDataType
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"demo" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    
    return response.MIMEType;
}

- (IBAction)loadPDF:(id)sender {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"demo" ofType:@"pdf"];
    NSData *data = [NSData dataWithContentsOfFile:path];

    [self.viewer setDataDetectorTypes:UIDataDetectorTypeAll];
    [self.viewer loadData:data MIMEType:[self getDataType] textEncodingName:@"UTF-8" baseURL:nil];
    
    
}

- (IBAction)loadHTML:(id)sender {
    NSString *html = @"<script>alert(1);</script>";
    [self.viewer setDataDetectorTypes:UIDataDetectorTypeAll];
    [self.viewer loadHTMLString:html baseURL:nil];
}
@end
