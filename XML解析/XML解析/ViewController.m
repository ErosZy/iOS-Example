//
//  ViewController.m
//  XML解析
//
//  Created by mac on 14-7-18.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"
#import "videoObject.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *xmlArr;
@property (nonatomic,strong) NSString *currentName;
@property (nonatomic,strong) NSMutableString *elementValue;
@property (nonatomic,strong) videoObject *video;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *path = [mainBundle pathForResource:@"localXML" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    [xmlParser setDelegate:self];
    [xmlParser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化工作
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.xmlArr = [@[] mutableCopy];
    self.elementValue = [@"" mutableCopy];
    self.currentName = @"";
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    if([elementName isEqualToString:@"videos"]){
        return;
    }else if([elementName isEqualToString:@"video"]){
        if(self.video){
            self.video.teacher = self.elementValue;
            self.currentName = @"";
            self.elementValue = [@"" mutableCopy];
        }
        self.video = [[videoObject alloc] init];
        [self.xmlArr addObject:self.video];
    }else if([elementName isEqualToString:@"name"]){
        self.currentName = @"name";
    }else{
        [self.video setValue:self.elementValue forKey:self.currentName];
        self.currentName = elementName;
        self.elementValue = [@"" mutableCopy];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.elementValue appendString:string];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"parse end");
}

@end
