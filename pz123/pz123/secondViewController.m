//
//  secondViewController.m
//  pz123
//
//  Created by Cindy Zheng on 9/15/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "secondViewController.h"
#import "thirdViewController.h"
#import "firstViewController.h"

@interface secondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation secondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.textField.text = self.mytext;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"2to3"]) {
        if ([segue.destinationViewController isKindOfClass:[ thirdViewController class]]) {
            thirdViewController * sVC = (thirdViewController *) segue.destinationViewController;
            sVC.mytext = self.textField.text;
            sVC.title = @"third";

        }
        
    }
}

- (IBAction)backCustomized:(UIBarButtonItem *)sender {
    
    
        // [self.navigationController popToRootViewControllerAnimated:YES];
        int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
        
        firstViewController *parent = [self.navigationController.viewControllers objectAtIndex:currentVCIndex-1];
        [self.navigationController popToViewController:parent animated:YES];
        
        parent.mytext = self.textField.text;
    
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
