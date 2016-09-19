//
//  ViewController.m
//  CurrencyConverterApp
//
//  Created by Ruby on 1/5/16.
//  Copyright © 2016 Hello World Organisation. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController
- (IBAction)buttonClicked:(id)sender {
    
    self.convertButton.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
    
}
- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    
    double inputValue= [self.inputField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    
    double czkValue = inputValue * currencies.CZK;
    
    double gbpValue = inputValue * currencies.GBP;
    
    
    NSString *euroString = [NSString stringWithFormat:@"%.2f",euroValue];
    NSString *czkString = [NSString stringWithFormat:@"%.2f",czkValue];
    NSString *gbpString = [NSString stringWithFormat:@"%.2f",gbpValue];
    
    self.currencyA.text = euroString;
    
    self.currencyB.text = czkString;
    
    self.currencyC.text = gbpString;
    
}


@end
