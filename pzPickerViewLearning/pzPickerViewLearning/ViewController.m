//
//  ViewController.m
//  pzPickerViewLearning
//
//  Created by Cindy Zheng on 8/18/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myPicker = [[UIPickerView alloc]init];
    self.myPicker.center = self.view.center;
    self.myPicker.dataSource =self;
    self.myPicker.delegate = self;
    
    [self.view addSubview: self.myPicker];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);



}

//pickerView data source protocol required methods.

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([pickerView isEqual:self.myPicker]) {
        return 1;
    }
    return 0;
    
    
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    if ([pickerView isEqual:self.myPicker]) {
        return 10;
    }
    
    return  0;
    
    
}

//picker view delegate optional method.

-(NSString *)pickerView:(UIPickerView *)pickerView  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.myPicker]) {
        return  [NSString stringWithFormat:@"Row %ld",(long)row +1];
        
    }
    return  nil;
    
}

- (NSInteger)selectedRowInComponent:(NSInteger)component
{
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    return  component;
    
    
}


@end
