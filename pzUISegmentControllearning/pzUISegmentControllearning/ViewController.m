//
//  ViewController.m
//  pzUISegmentControllearning
//
//  Created by Cindy Zheng on 8/19/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    NSArray *segment = [[NSArray alloc]initWithObjects:@"iphone",@"ipad",@"ipod",@"itouch", nil];
    self.mySegmentControl = [[UISegmentedControl alloc ]initWithItems:segment];
    

    self.mySegmentControl.center = self.view.center;
    
    [self.view addSubview: self.mySegmentControl];
    
    [self.mySegmentControl addTarget:self action:@selector(SegmentControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    

}

-(void)SegmentControlValueChanged : (UISegmentedControl *)paramSender
{
    
    
    if ([paramSender isEqual:self.mySegmentControl]) {
        
        NSInteger selectedSegmentIndex = [paramSender selectedSegmentIndex];
        NSString * selectedSegmentText = [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
        NSLog( @"segment  %i is selected with title is %@", selectedSegmentIndex,selectedSegmentText);
        
 
    }
    
}




@end
