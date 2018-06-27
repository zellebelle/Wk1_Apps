//
//  ViewController.m
//  TipCalc
//
//  Created by Gisele Phalo on 6/26/18.
//  Copyright © 2018 Gisele Phalo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet
UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet
    UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet
    UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet
    UISegmentedControl *tipControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.mealBillField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;

    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame =
        CGRectMake(self.mealBillField.frame.origin.x,
            self.mealBillField.frame.origin.y + 30,
            self.mealBillField.frame.size.width,
            self.mealBillField.frame.size.height);
    
        self.tipLabel.alpha = 0;
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 0;
    }];
    
}
    
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y -=30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame = newFrame;
    
        self.tipLabel.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
