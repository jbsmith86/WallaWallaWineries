//
//  WineryAddressViewController.h
//  WWwineries
//
//  Created by Joel Smith on 4/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MKAnnotation.h>
#import <CoreLocation/CoreLocation.h>

@interface WineryAddressViewController : UITableViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableViewCell *wineryname;
@property (weak, nonatomic) IBOutlet UITableViewCell *addresscitystatezip;
@property (weak, nonatomic) NSString *address;
@property (weak, nonatomic) NSString *city;
@property (weak, nonatomic) NSString *state;
@property (weak, nonatomic) NSString *zip;
@property (weak, nonatomic) IBOutlet UITableViewCell *phone;
@property (nonatomic, assign) CLLocationCoordinate2D *winerylocation;

@end
