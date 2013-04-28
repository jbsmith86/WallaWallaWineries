//
//  WineryAddressViewController.m
//  WWwineries
//
//  Created by Joel Smith on 4/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import "WineryAddressViewController.h"
#import "ViewController.h"

@interface WineryAddressViewController ()

@end

@implementation WineryAddressViewController
@synthesize back, wineryname, address, city, state, zip, phone, winerylocation;

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)callwinery:(id)sender {
    NSString *prefix = @"telprompt://";
    NSString *telurl = [prefix stringByAppendingString:self.phone.text];
    NSLog(@"%@", telurl);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telurl]];
}

- (IBAction)getdirections:(id)sender {
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
