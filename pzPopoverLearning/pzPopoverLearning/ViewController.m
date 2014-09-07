//
//  ViewController.m
//  pzPopoverLearning
//
//  Created by Cindy Zheng on 8/21/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"
#import "pzContentViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIPopoverController * myPopoverController;
@property (nonatomic,strong)UIBarButtonItem * myBarButtonAdd;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    //see if this class exists on IOS runing the app
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    
    if (popoverClass !=nil && UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPad ) {
     
        pzContentViewController *content = [[pzContentViewController alloc]initWithNibName:nil bundle:nil];
        
        //2 steps for this to be working
        //1) instantiate a popovercontroller
        //2) setup popoverController's contentviewcontroller to be my cutomiszed contentView (which has a popovercontroller property)
        //2) setup customized contentViewcontrol's popovercontroler to be 1)
        
        self.myPopoverController = [[UIPopoverController alloc ] initWithContentViewController:content];
        
        content.myPopoverController = self.myPopoverController ;
        
        
        self.myBarButtonAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithPopover:)];

        NSLog(@"ipad");
        
        
    }else {
        
        self.myBarButtonAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                           target:self action:@selector(performAddWithAlertView:)];
        NSLog(@"iphone");

    }
    
    [self.navigationItem setRightBarButtonItem: self.myBarButtonAdd animated:NO];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);


}

-(NSString *)photoButtonTitle
{
    return @"Photo";
    
}

-(NSString *)audioButtonTitle
{
    return  @"Audio";
    
}

-(void ) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString * buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:[self photoButtonTitle]]) {
        
        NSLog (@"adding a photo");
        NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    }else if ([buttonTitle isEqualToString: [self audioButtonTitle]]){
        NSLog(@"upload audio file..");
        NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    }
        
        
 }

 -(void)performAddWithPopover:(UIBarButtonItem *)paramSender
{
    [self.myPopoverController presentPopoverFromBarButtonItem:self.myBarButtonAdd
                                     permittedArrowDirections:UIPopoverArrowDirectionAny
                                                     animated:YES];
    
    
    
}

-(void)performAddWithAlertView:(UIBarButtonItem *)paramSender
{
    //UIAlertView *alert = [UIAlertView alloc]initWithTitle:nil message:@"add..." delegate:self cancelButtonTitle:nil otherButtonTitles: [self photoButtonTitle]  , nil ];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"add..." delegate:self cancelButtonTitle:nil otherButtonTitles:[self photoButtonTitle] ,[self audioButtonTitle], nil]   ;
    
    [alert show];
    
    
}



@end