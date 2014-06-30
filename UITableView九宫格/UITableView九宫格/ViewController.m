//
//  ViewController.m
//  UITableView九宫格
//
//  Created by mac on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *mutableData;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mutableData = [NSMutableArray array];
    
    for(int i = 0; i < 30; i++){
        NSString *title = [NSString stringWithFormat:@"产品---%d",i];
        NSString *image = [NSString stringWithFormat:@"images.bundle/tmall_icon_cat_outing_%d",arc4random_uniform(11)+1];
        self.mutableData[i] = @{@"title":title,@"image":image};
    }
    
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    
    
                        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ceil(self.mutableData.count/4.0);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell)
    {
        cell = [[ProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    int locate = indexPath.row*4;
    int len = locate+4 > self.mutableData.count ? self.mutableData.count - locate : 4;
    NSArray *subArray = [self.mutableData subarrayWithRange:NSMakeRange(indexPath.row*4, len)];
    
    [cell setCellData:subArray];
    
    return cell;
}

@end
