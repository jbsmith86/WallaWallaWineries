//
//  ViewController.h
//  WWwineries
//
//  Created by Joel Smith on 3/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import "WineryAddressViewController.h"

//@interface ViewController : UIViewController
//@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@interface ViewController : UIViewController <MKMapViewDelegate> {
    
    IBOutlet MKMapView *mapView;
    
}

@property(nonatomic, retain) IBOutlet MKMapView *mapView;
@end
