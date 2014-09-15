//
//  thirdViewController.m
//  pz123
//
//  Created by Cindy Zheng on 9/15/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "thirdViewController.h"
#import "secondViewController.h"
#import "fourViewController.h"

@interface thirdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation thirdViewController



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"3tofour"]) {
        if ([segue.destinationViewController isKindOfClass:[ fourViewController class]]) {
            fourViewController * sVC = (fourViewController *) segue.destinationViewController;
            sVC.mytext = self.textField.text;
            sVC.title = @"four";
            
        }
        
    }
}

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
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
    
    secondViewController *parent = (secondViewController *)[self.navigationController.viewControllers objectAtIndex:currentVCIndex];
    
    parent.mytext = self.textField.text;
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
