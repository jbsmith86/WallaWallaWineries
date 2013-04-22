//
//  ViewController.h
//  WWwineries
//
//  Created by Joel Smith on 3/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <sqlite3.h>
#import "RXMLElement.h"
#import <AddressBook/AddressBook.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
