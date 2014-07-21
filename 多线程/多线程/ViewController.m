//
//  ViewController.m
//  多线程
//
//  Created by mac on 14-7-21.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableString *s;
@property (nonatomic,assign) int ticks;
@property (nonatomic,strong) NSLock *lock;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.s = [@"" mutableCopy];
    self.ticks = 20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)appendNumWithTarget:(NSString *)target
{
    NSString *appendStr = @"";
    if(self.ticks > 0){
        appendStr = [NSString stringWithFormat:@"卖票人:%@,剩余----%d张票\r\n",target,self.ticks];
    }else{
        appendStr = [NSString stringWithFormat:@"卖完了\r\n"];
    }
    [self.s appendString:appendStr];
    [self.textView scrollRangeToVisible:NSMakeRange(self.s.length, 1)];
    self.textView.text = self.s;
}

-(void)sellTick:(NSString *)target
{
    if(!_lock){
        _lock = [[NSLock alloc] init];
    }
    
    while (true) {
        [_lock lock];
        if(self.ticks > 0){
            self.ticks--;
            [self performSelectorOnMainThread:@selector(appendNumWithTarget:) withObject:target waitUntilDone:YES];
            [_lock unlock];
            if([target isEqualToString:@"t1"]){
                [NSThread sleepForTimeInterval:0.2];
            }else{
                [NSThread sleepForTimeInterval:1];
            }
        }else{
            [self performSelectorOnMainThread:@selector(appendNumWithTarget:) withObject:target waitUntilDone:YES];
            [_lock unlock];
            break;
        }
    }
}

- (IBAction)startNSThread:(id)sender {
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTick:) object:@"t1"];
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTick:) object:@"t2"];
    [t2 start];
}

-(void)sellTick2:(NSString *)target
{
    while(true)
    {
        if(self.ticks > 0){
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self appendNumWithTarget:target];
                self.ticks--;
            }];
            
            if([target isEqualToString:@"t1"]){
                [NSThread sleepForTimeInterval:1];
            }else{
                [NSThread sleepForTimeInterval:0.2];
            }
        }else{
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self appendNumWithTarget:target];
            }];
            break;
        }
    }
}

- (IBAction)startInvocation:(id)sender {
    NSInvocationOperation *t1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(sellTick2:) object:@"t1"];
    
    NSInvocationOperation *t2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(sellTick2:) object:@"t2"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperation:t1];
    [queue addOperation:t2];
}

- (IBAction)startBlock:(id)sender {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        [self sellTick2:@"t1"];
    }];
    [queue addOperationWithBlock:^{
        [self sellTick2:@"t2"];
    }];
}


-(void)sellTick3:(NSString *)target
{
    while(true){
        if(self.ticks > 0){
            dispatch_async(dispatch_get_main_queue(), ^{
                [self appendNumWithTarget:target];
                self.ticks--;
            });
            if([target isEqualToString:@"t1"]){
                [NSThread sleepForTimeInterval:1];
            }else{
                [NSThread sleepForTimeInterval:0.2];
            }
        }else{
            break;
        }
    }
}

- (IBAction)startGCD:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_async(queue, ^{
        [self sellTick3:@"t1"];
    });
    
    dispatch_async(queue, ^{
        [self sellTick3:@"t2"];
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"卖完了");
    });
}




@end
