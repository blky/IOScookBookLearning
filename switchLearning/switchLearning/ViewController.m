//
//  ViewController.m
//  switchLearning
//
//  Created by Cindy Zheng on 8/18/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(100, 100, 0, 0)];
    
    [self.view addSubview: self.mainSwitch];
    [self.mainSwitch setOn:YES];
    
    
    
    if (self.mainSwitch.isOn) {
        NSLog(@"this switch is on");
        
    }else {
        NSLog(@"the switch is off");
    
    }
    
    //customize main switch style
    self.mainSwitch.tintColor = [UIColor redColor];
    self.mainSwitch.onTintColor=[UIColor brownColor];
    self.mainSwitch.thumbTintColor = [UIColor greenColor];
    
    
    
    //manually add switch into GUI and track the event
    [self.mainSwitch addTarget:self action:@selector(switchIsChanged:) forControlEvents:UIControlEventValueChanged];

    
 }

//respond to selector event
-(void) switchIsChanged:(UISwitch   *)paramSender
{
    NSLog(@"sender is =%@",paramSender);
    
    if ([paramSender isOn]) {
        NSLog(@ "via addTarget --- the main switch is turned ON" );
        
    }else {
        NSLog((@"via addTarget --- the main switch is turned OFF"));
        
    }
}

//track switch event via interface builder
- (IBAction)switchValueChanged:(UISwitch *)sender {
    
    NSLog (@"sender is %@",sender);
    
    if (self.switchButton.isOn) {
         NSLog(@"via interface builder  -- switch value changed to ON");
 
        
    }else{
        NSLog(@"via interface builder  -- switch value changed to OFF");
        
    }
}



@end
