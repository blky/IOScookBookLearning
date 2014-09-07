//
//  ModelController.h
//  pzPageViewLearning
//
//  Created by Cindy Zheng on 8/21/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
