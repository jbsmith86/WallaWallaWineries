//
//  WineryAddressViewController.h
//  WWwineries
//
//  Created by Joel Smith on 4/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MKAnnotation.h>

@interface WineryAddressViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UILabel *wineryname;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *state;
@property (weak, nonatomic) IBOutlet UILabel *zip;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (nonatomic, assign) CLLocationCoordinate2D *winerylocation;

@end
