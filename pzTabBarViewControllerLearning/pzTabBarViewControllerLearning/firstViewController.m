//
//  firstViewController.m
//  pzTabBarViewControllerLearning
//
//  Created by Cindy Zheng on 8/20/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "firstViewController.h"

@interface firstViewController ()

@end

@implementation firstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"First";
        //this is to show at tab bar icon image
        self.tabBarItem.image = [UIImage imageNamed:@"archive-25.png"];
        
        self.view.backgroundColor =[UIColor whiteColor];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}




@end
