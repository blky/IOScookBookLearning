//
//  MySeguePZ.m
//  pzLearningInterfaceBuilding
//
//  Created by Cindy Zheng on 9/8/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "MySeguePZ.h"

@implementation MySeguePZ


-(void)perform
{
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    
    [UIView  transitionFromView:source.view
                          toView:destination.view
                        duration:1.05f
                         options:UIViewAnimationOptionTransitionFlipFromTop
                      completion:^(BOOL finished) {
                          NSLog(@"Transitioning is finished"); }];
     
     
   
     
    
}

@end
