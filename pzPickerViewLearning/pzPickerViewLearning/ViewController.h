//
//  ViewController.h
//  pzPickerViewLearning
//
//  Created by Cindy Zheng on 8/18/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewAccessibilityDelegate>


@property (nonatomic, strong) UIPickerView *myPicker;

@end
