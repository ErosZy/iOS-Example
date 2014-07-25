//
//  ViewController.m
//  AFN框架使用
//
//  Created by mac on 14-7-25.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableString *info;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.info = [@"" mutableCopy];
    self.textField.userInteractionEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendGET:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://localhost:8080/get?name=aaa" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",operation);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)sendPOST:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://localhost:8080/post" parameters:@{@"age":@12,@"name":@"zy"} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSLog(@"%@",formData);
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)download:(id)sender {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    NSURL *url = [NSURL fileURLWithPath:@"/Users/mac/Downloads/download.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSProgress *progress = [NSProgress progressWithTotalUnitCount:1];
    [progress addObserver:self
               forKeyPath:NSStringFromSelector(@selector(fractionCompleted))
                  options:NSKeyValueObservingOptionInitial
                  context:@"Progress"];
    
    [progress becomeCurrentWithPendingUnitCount:1];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        return [NSURL fileURLWithPath:@"/Users/mac/Downloads/download2.zip"];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"complete");
    }];
    
    [downloadTask resume];
}

- (IBAction)upload:(id)sender {
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfig];
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/post"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSProgress *p = [[NSProgress alloc] init];
    [p addObserver:self
               forKeyPath:NSStringFromSelector(@selector(fractionCompleted))
                  options:NSKeyValueObservingOptionInitial
                  context:@"Progress"];
    
    NSURLSessionUploadTask *upload = [manager uploadTaskWithRequest:request fromFile:[NSURL fileURLWithPath:@"/Users/mac/Downloads/download.zip"] progress:&p completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    [upload resume];
}

- (IBAction)uploadWithStream:(id)sender {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://localhost:8080/post" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"/User/Application/Download/download.zip"] name:@"uploadFile" error:nil];
    } error:nil];
    
    NSURLSessionUploadTask *upload = [manager uploadTaskWithStreamedRequest:request progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSLog(@"complete");
    }];
    
    [upload resume];
}

- (IBAction)netWorkReachable:(id)sender {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%@",AFStringFromNetworkReachabilityStatus(status));
    }];
    
    AFHTTPRequestOperationManager *request = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:8080/post"]];
    
    NSOperationQueue *operationQueue = request.operationQueue;
    
    AFNetworkReachabilityManager *manager = request.reachabilityManager;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%d",status);
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(context == @"Progress"){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSProgress *p = (NSProgress *)object;
            [self.info appendFormat:@"%@\r\n",p.localizedDescription];
            self.textField.text = self.info;
        });
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
@end
