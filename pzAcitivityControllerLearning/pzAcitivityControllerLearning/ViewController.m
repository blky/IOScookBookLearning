//
//  ViewController.m
//  pzAcitivityControllerLearning
//
//  Created by Cindy Zheng on 8/19/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"
#import "pzStringReverseActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createTextField];
    [self createButton];

    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

}


#pragma mark  -   UI functions

-(void)createButton
{
   
    self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonShare.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonShare.frame = CGRectMake(20, 80, 280, 44);
    [self.buttonShare setTitle:@"Share" forState:UIControlStateNormal];
    
    [self.buttonShare addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: self.buttonShare];
    
    
}


-(void)createTextField
{
    
    self.myTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 35, 280, 30)];
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.myTextField.placeholder = @"Enter text to share ....";
    self.myTextField.delegate = self;
    
    [self.view addSubview: self.myTextField];
    
}

-(void)buttonClicked: (UIButton *)sender
{
    if ([self.myTextField.text length ]==0) {
        NSString *message =@"Please enter a text and then press share button";
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]  ;
        [alertView show];
        return;
    
    }
    self.activityViewController =[[UIActivityViewController alloc]initWithActivityItems:@[self.myTextField.text] applicationActivities:nil];
    
    //model another uiviewcontroller on top of the current viewcontroller. here is activityviewcontroler
    [self presentViewController:self.activityViewController
                       animated:YES
                     completion:^{
                     }];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    pzStringReverseActivity * myNewAcitivities = [[pzStringReverseActivity alloc]init];
    
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    NSArray * itemToShare = @[@"item 1",@"item 2",@"item 3"];
     
    //using @[] to convert id into nsarray (applicationAcitivities]
    UIActivityViewController *activity = [[UIActivityViewController alloc]initWithActivityItems:itemToShare
                                                                          applicationActivities:@[myNewAcitivities]];
    
    
    [self presentViewController:activity animated:YES completion:nil];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    
    
}

@end
