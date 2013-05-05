//
//  WineryAddressViewController.m
//  WWwineries
//
//  Created by Joel Smith on 4/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import "WineryAddressViewController.h"
#import "ViewController.h"
#import "WineryAnnotation.h"

@implementation WineryAddressViewController


- (IBAction)callwinery:(id)sender {
    NSString *prefix = @"telprompt://";
    NSString *telurl = [prefix stringByAppendingString:self.phone.text];
    NSLog(@"%@", telurl);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telurl]];
}


- (IBAction)directions:(id)sender {
    //ViewController *test = [[UIApplication sharedApplication] keyWindow].rootViewController;
    //CLLocationCoordinate2D *usercoord = test.currloc;
    
    //WineryAnnotation *origin = [[WineryAnnotation alloc]init];
    //NSLog(@"%f", usercoord->latitude);
    //NSLog(@"%f", usercoord->longitude);
    //[objMapView addAnnotation:origin];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [locations lastObject];
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
