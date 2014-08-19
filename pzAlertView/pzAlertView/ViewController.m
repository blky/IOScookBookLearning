//
//  ViewController.m
//  pzAlertView
//
//  Created by Cindy Zheng on 8/18/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

-(NSString *) yesButtonTitle
{
    return @"Yes";
    
}

-(NSString *)noButtonTitle
{
    return  @"No";
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    
    
}

/* set up URL open style ofr alert view
 
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString * message = @"Are you sure want to open this URL?";
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"open Link?" message:message delegate:self cancelButtonTitle:[self noButtonTitle] otherButtonTitles:[self yesButtonTitle] , nil] ;
    [alertView show];
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString * buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:[self yesButtonTitle]]) {
        //send to url
        NSLog(@"user pressed yes button");
        NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    }else {
        //cancel
        
        NSLog(@"user pressed no button");
        NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

        
    }
        
 

    
}

*/

//alert view style learning

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"credit card number" message:@"Please enter your credit card number" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    
    //[alertView setAlertViewStyle: UIAlertViewStylePlainTextInput];
    
    [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput]; //change to login style of alerview pattern design
    
    
    UITextField * textField = [alertView  textFieldAtIndex:0];
    
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    [alertView show];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    
    
}
 


@end
