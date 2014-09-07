//
//  ViewController.m
//  pzProgressViewLearning
//
//  Created by Cindy Zheng on 8/21/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic)UIProgressView * myProgressView ;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.myProgressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    self.myProgressView.center = self.view.center;
    
    self.myProgressView.tintColor=[UIColor redColor];
    self.myProgressView.trackTintColor = [UIColor greenColor];
    //self.myProgressView.tintColorDidChange = [UIColor greenColor];
    self.myProgressView.progress = 20/30.0f;
    
    [self.view addSubview: self.myProgressView];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    



}



@end
