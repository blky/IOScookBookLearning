//
//  FirstViewController.m
//  pzNavigationControllerLearning
//
//  Created by Cindy Zheng on 8/20/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property (strong,nonatomic)UIButton * myButton;

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) barButtonAdd:(id)paramSender
{
    NSLog(@"bar buttone add clicked");
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myButton = [UIButton buttonWithType:UIButtonTypeSystem ];
    [self.myButton setTitle:@"display second view controller" forState:UIControlStateNormal];
    [self.myButton sizeToFit];
    
    self.myButton.center = self.view.center;
    
    [self.myButton addTarget:self action:@selector(buttonClickedforSecondViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview: self.myButton];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    self.title = @"FIRST ";
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonAdd:)];
    
    //using iphone system icon for the bar button item, make sure handel iphone 3 and iphoen 4 cases by using NS_EUM
    // self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(barButtonAdd:)];

    //customize bar buttone items with uisegmentcontrol
    
    NSArray *  items = @ [@"up",@"down"];
               
    UISegmentedControl * segmentControl =[[UISegmentedControl alloc]initWithItems:items];
    
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithCustomView:segmentControl  ];
    
    [segmentControl addTarget: self action:@selector(segmentControllerClicked:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)segmentControllerClicked :(UISegmentedControl *)sender
{
   
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"up clicked");
            [self.myButton setTitle:@"Up" forState:UIControlStateNormal];

            
            break;
            
        default:
            NSLog(@"down clicekd");
            [self.myButton setTitle:@"Down" forState:UIControlStateNormal];
            break;
    }
}

-(void)buttonClickedforSecondViewController:(UIButton *) sender
{
    SecondViewController * secondViewController = [[SecondViewController alloc]initWithNibName:nil bundle:NULL    ];
     
    [self.navigationController pushViewController:secondViewController animated:YES ];
    
}




@end
