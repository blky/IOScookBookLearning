//
//  ViewController.m
//  pzSliderlearning
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


    self.mySlider = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, 200, 23)];
    
    self.mySlider.center = self.view.center;
    self.mySlider.minimumValue=0.0f;
    self.mySlider.maximumValue=100.0f;
    self.mySlider.value = self.mySlider.maximumValue /2.0;
    
     [self.view addSubview: self.mySlider];
    
    //register to listen to the event of slider
    [self.mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    /* Change the minimum value image
    [self.slider setMinimumValueImage:[UIImage imageNamed:@"MinimumValue"]];
    
      Change the minimum track image
    [self.slider setMinimumTrackImage:[self minimumTrackImage]
                             forState:UIControlStateNormal];
    
      Change the thumb image for both untouched and touched states
    [self.slider setThumbImage:[UIImage imageNamed:@"Thumb"]
                      forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"Thumb"]
                      forState:UIControlStateHighlighted];
    
      Change the maximum track image
    [self.slider setMaximumTrackImage:[self maximumTrackImage]
                             forState:UIControlStateNormal];
    
     Change the maximum value image
    [self.slider setMaximumValueImage:[UIImage imageNamed:@"MaximumValue"]];
    
    */
    
    
    self.mySlider.minimumTrackTintColor = [UIColor redColor];
    self.mySlider.maximumTrackTintColor = [UIColor greenColor];
    self.mySlider.thumbTintColor = [UIColor blueColor];
    
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    

}

-(void)  sliderValueChanged: (UISlider *)paramSlider
{
    NSLog( @"slider valued changed to %f", self.mySlider.value);
    
}
 

@end
