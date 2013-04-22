//
//  ViewController.m
//  WWwineries
//
//  Created by Joel Smith on 3/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import "ViewController.h"
#define METERS_PER_MILE 1609.344

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 46.065;
    zoomLocation.longitude= -118.330278;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 14*METERS_PER_MILE, 14*METERS_PER_MILE);
    [_mapView setRegion:viewRegion animated:YES];
    RXMLElement *rootXML = [RXMLElement elementFromXMLFile:@"winerydb.xml"];
    NSArray *wineries = [rootXML children:@"Winery"];
    
    
    for (RXMLElement* winery in wineries){
        //NSLog(@"%@", winery.text);
    
        RXMLElement *wineryname = [winery child:@"Winery_Name"];
        RXMLElement *lat = [winery child:@"Latitude"];
        double latitude = lat.textAsDouble;
        RXMLElement *lon = [winery child:@"Longitude"];
        double longitude = lon.textAsDouble;
        //NSString *address = ([winery child:@"Address"]).text;
        //address = [address stringByAppendingString:@"\n"];
        //address = [address stringByAppendingString:([wineries[5] child:@"City"]).text];
        //address = [address stringByAppendingString:@", "];
        //address = [address stringByAppendingString:([wineries[5] child:@"State"]).text];
        //address = [address stringByAppendingString:([wineries[5] child:@"Zip"]).text];
    
        CLLocationCoordinate2D coords;
        coords.latitude = latitude;
        coords.longitude = longitude;
    
        //NSDictionary *addressdict = @{@"kABPersonAddressStreetKey" : address, @"kABPersonAddressCityKey" : city, @"kABPersonAddressStateKey" : state, @"kABPersonAddressZIPKey" : zip};
    
        MKPointAnnotation *placemark = [[MKPointAnnotation alloc] init];
        placemark.coordinate = coords;
        placemark.title = wineryname.text;
        
        NSString *name = wineryname.text;
        
        MKAnnotationView *test = [[MKAnnotationView alloc] initWithAnnotation:placemark reuseIdentifier:name];
        test.canShowCallout = YES;
        test.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
    
        [_mapView addAnnotation:placemark];
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
