//
//  ViewController.m
//  arrayLearning
//
//  Created by Cindy Zheng on 9/3/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   // NSArray * myArray4 = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:@"http://www.icodeblog.com/"]];
    
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* filePath    = [rootPath stringByAppendingPathComponent:@"pz.plist"];
    NSLog(@"Writing plist to: %@", filePath);
    
    NSString *myfile = [[NSBundle mainBundle] pathForResource:@"pz" ofType:@"plist"];
    NSLog(@"file path is %@",myfile);
    
    NSMutableArray *myArray4 = [NSMutableArray arrayWithContentsOfFile: myfile];
    NSLog(@"the array is %@",myArray4);

    NSLog(@"array [1] is %@",myArray4[1]);
    

}



@end
