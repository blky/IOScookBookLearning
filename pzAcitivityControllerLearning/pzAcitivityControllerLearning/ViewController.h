//
//  ViewController.h
//  pzAcitivityControllerLearning
//
//  Created by Cindy Zheng on 8/19/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic)UITextField * myTextField;
@property (strong, nonatomic)UIButton * buttonShare;
@property (strong,nonatomic)UIActivityViewController *activityViewController;


@end
