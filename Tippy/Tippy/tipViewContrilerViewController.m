//
//  tipViewContrilerViewController.m
//  Tippy
//
//  Created by Cindy Zheng on 7/10/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "tipViewContrilerViewController.h"
#import "tipModel.h"

@interface tipViewContrilerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextBox;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegment;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalAmountLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipSliderAmount;

@property (strong,nonatomic) tipModel *tip;

@end

@implementation tipViewContrilerViewController

#pragma mark - model late initialization


-(tipModel *)tip
{
    if (!_tip) {
        _tip = [[tipModel alloc]init];
    }
    return _tip;
    
}

#pragma mark - UI related

- (IBAction)tipSliderChanged:(id)sender {
    [self dismissKeyboard];
    self.tipPercentageSegment.selectedSegmentIndex = -1;
    self.tipSliderAmount.text =  [NSString stringWithFormat: @"%.02f%%",self.tipSlider.value*100];
    

    self.tip.billAmount= [self.billAmountTextBox.text floatValue];
    self.tip.tipPercent = self.tipSlider.value  ;
    
    [self updateTipDisplay];
    
}


- (IBAction)billChange:(UITextField *)sender {
    
    //highlight all text content before editing the bill amount
    [sender performSelector:@selector(selectAll:) withObject:sender afterDelay:0.f];
    
    
    [self UIreset];
    
    
}




- (IBAction)tipChosen:(UISegmentedControl *)sender {
    [self dismissKeyboard];
    NSArray *tipArray = @[@(0.10),@(0.15),@(0.20)];
    self.tip.billAmount = [self.billAmountTextBox.text floatValue];
    self.tip.tipPercent=  [tipArray [self.tipPercentageSegment.selectedSegmentIndex] floatValue];
    
    [self updateTipDisplay];
    
}

-(void)dismissKeyboard {
    [self.billAmountTextBox resignFirstResponder];
}

-(void)updateTipDisplay
{
    self.tipAmountLabel.text = [NSString stringWithFormat:@"(%.02f%% )tip value is %.02f ",  self.tip.tipPercent  * 100,[self.tip tipTotal]];
    self.TotalAmountLabel.text = [NSString stringWithFormat:@"total amount is %.02f ", [self.tip billTotal]];
    
}

-(void)UIreset
{
    self.tipAmountLabel.text =  @"";
    self.TotalAmountLabel.text = @"";
    self.tipPercentageSegment.selectedSegmentIndex = -1;

    
    

}

#pragma  mark - UIViewController events
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tipPercentageSegment.selectedSegmentIndex =-1;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

}




@end
