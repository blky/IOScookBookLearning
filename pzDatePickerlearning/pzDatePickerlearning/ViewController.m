//
//  ViewController.m
//  pzDatePickerlearning
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
 
    self.myDatePicker = [[UIDatePicker alloc]init];
    self.myDatePicker.center = self.view.center;
   
    //only give date no time to pick with this property
    //self.myDatePicker.datePickerMode = UIDatePickerModeDate;
    self.myDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    
    
    [self.view addSubview:self.myDatePicker];
    
    
    //setup date picker range
    NSTimeInterval oneYearTime = 365*24*60*60;
    NSDate *todayDate = [NSDate date]; //A new date object set to the current date and time.
    
    NSDate *oneYearFromToday =[todayDate dateByAddingTimeInterval: -oneYearTime];
    NSDate *twoYearsFromToday = [todayDate dateByAddingTimeInterval:2*oneYearTime];
    self.myDatePicker.minimumDate = oneYearFromToday;
    self.myDatePicker.maximumDate = twoYearsFromToday;
    
    
    //listen to the UI change event
    [self.myDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    

}

-(void)datePickerChanged: (UIDatePicker *)paramDatePicker
{
    NSLog(@"date picked is %@", self.myDatePicker.date);
    
}


@end
