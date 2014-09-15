//
//  firstViewController.m
//  pz123
//
//  Created by Cindy Zheng on 9/15/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "firstViewController.h"
#import "secondViewController.h"

@interface firstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation firstViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"1to2"]) {
        if ([segue.destinationViewController isKindOfClass:[secondViewController class]]) {
            secondViewController * sVC = (secondViewController *) segue.destinationViewController;
            sVC.mytext = self.textField.text;
            sVC.title = @"second";
            
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.textField.text = self.mytext;
    
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
