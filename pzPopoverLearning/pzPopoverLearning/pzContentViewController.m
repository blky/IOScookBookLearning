//
//  pzPopOverViewController.m
//  pzPopoverLearning
//
//  Created by Cindy Zheng on 8/21/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "pzContentViewController.h"

@interface pzContentViewController ()
@property (nonatomic,strong)UIButton * buttonPhoto;
@property (nonatomic,strong)UIButton *buttonAudio;
@property (nonatomic,strong)UIBarButtonItem * myBarButtonAdd;


@end

@implementation pzContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(200.0f, 125.0f);
    CGRect buttonRect = CGRectMake(20.0f, 20.0f, 160.0f, 37.0f);
    self.buttonPhoto = [UIButton buttonWithType:UIButtonTypeSystem  ];
    [self.buttonPhoto setTitle:@"Photo" forState:UIControlStateNormal];
    [self.buttonPhoto addTarget:self action:@selector(gotoAppleWebSites:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonPhoto.frame = buttonRect;
    [self.view addSubview: self.buttonPhoto];
    
    buttonRect.origin.y += 50.0f;
    self.buttonAudio = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonAudio setTitle:@"Audio" forState:UIControlStateNormal];
    [self.buttonAudio addTarget:self action:@selector(gotoAppleWebSites:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonAudio.frame = buttonRect;
    
    [self.view addSubview:self.buttonAudio];
    
    
 }

-(BOOL)isPopover
{
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    
    if (popoverClass !=nil && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && self.myPopoverController !=nil) {
        
        
        return  YES;
        
        
    }else {
        return NO;
        
    }
    
    
}

-(void)gotoAppleWebSites :(id)paramSender
{
    if ([self isPopover]) {
        
        [self.myPopoverController dismissPopoverAnimated:YES];
    } else {
        //handle otherwise for iphone
        NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
        
        
    }
    
    
}


@end
