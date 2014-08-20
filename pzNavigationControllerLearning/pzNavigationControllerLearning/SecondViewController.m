//
//  SecondViewController.m
//  pzNavigationControllerLearning
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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title =@"SECOND";
    
    
    
}

-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //this will automatically navigate back to first view controller
    
  //  [self performSelector:@selector(goBack) withObject:nil afterDelay:5.0f];
    
}

@end
