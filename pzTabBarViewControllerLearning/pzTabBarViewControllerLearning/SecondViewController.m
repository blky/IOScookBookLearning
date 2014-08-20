//
//  SecondViewController.m
//  pzTabBarViewControllerLearning
//
//  Created by Cindy Zheng on 8/20/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Second";
        self.tabBarItem.image =[UIImage imageNamed:@"box-25.png"];
        self.view.backgroundColor =[UIColor whiteColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    
}

 
 

@end
