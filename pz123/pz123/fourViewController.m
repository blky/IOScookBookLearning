//
//  fourViewController.m
//  pz123
//
//  Created by Cindy Zheng on 9/15/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "fourViewController.h"
#import "thirdViewController.h"

@interface fourViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textbox;

@end

@implementation fourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backBarButton:(UIBarButtonItem *)sender {
    
    // [self.navigationController popToRootViewControllerAnimated:YES];
    int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
    
    thirdViewController *parent = [self.navigationController.viewControllers objectAtIndex:currentVCIndex-1];
    [self.navigationController popToViewController:parent animated:YES];
    
    parent.mytext = self.textbox.text;
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    self.textbox.text = self.mytext;

}


@end
