//
//  ViewController.m
//  simplePicker
//
//  Created by Cindy Zheng on 8/18/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.pickerView.delegate =self;
    self.pickerView.dataSource = self;
    
}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return  1;
  
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    return 10;
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"PZRow %i",  row +1 ];
}

 
//button click to retrieve pickerView selected value


- (IBAction)selectedButton:(UIButton *)sender {
    
    
    NSInteger nRow = [self.pickerView selectedRowInComponent:0];
   // NSLog(@"pickerView=%@", self.pickerView); // <-- add check for null pointer
    NSLog(@"button clicked ---> Selected Index: %i  ", nRow);
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    
 }

//delegate event tracking on pickerView

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    NSLog(@"picker clicked ===> seleced row is %i", row);
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    
}

@end
