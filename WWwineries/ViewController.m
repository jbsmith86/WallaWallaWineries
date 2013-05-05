//
//  ViewController.m
//  WWwineries
//
//  Created by Joel Smith on 3/28/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import "ViewController.h"
#import "WineryAnnotation.h"
#import "WineryDatabase.h"

#define METERS_PER_MILE 1609.344

@implementation ViewController;
@synthesize mapView, currloc;

//@implementation UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMapPreferences];
    [self clearMapAndPlaceAnnotations];
}

-(void)setMapPreferences{
        mapView.showsUserLocation = YES;
        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = 46.065;
        zoomLocation.longitude= -118.330278;
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 14*METERS_PER_MILE, 14*METERS_PER_MILE);
        [mapView setRegion:viewRegion animated:YES];
        [mapView setMapType:MKMapTypeStandard];
        [mapView setZoomEnabled:YES];
        [mapView setScrollEnabled:YES];
        [mapView setDelegate:self];
        
}

-(void)clearMapAndPlaceAnnotations {
    [mapView removeAnnotations:mapView.annotations];
    if ( [mapView userLocation] != nil ) {
        [mapView addAnnotation:[mapView userLocation]]; // will cause user location pin to blink
    }
    for (RXMLElement* winery in [[WineryDatabase Database]wineries]) {
        
        RXMLElement *wineryname = [winery child:@"Winery_Name"];
        RXMLElement *lat = [winery child:@"Latitude"];
        double latitude = lat.textAsDouble;
        RXMLElement *lon = [winery child:@"Longitude"];
        double longitude = lon.textAsDouble;
        
        MKCoordinateRegion pin = { {0.0, 0.0} , {0.0, 0.0} };
        pin.center.latitude = latitude;
        pin.center.longitude = longitude;
        pin.span.longitudeDelta = 0.02f;
        pin.span.latitudeDelta = 0.02f;
        
        NSUInteger index = (NSUInteger)[[[WineryDatabase Database]wineries] indexOfObject:winery];
        
        
        WineryAnnotation *placemark = [[WineryAnnotation alloc] init];
        placemark.coordinate = pin.center;
        placemark.title = wineryname.text;
        placemark.idnumber = index;
        
        [mapView addAnnotation:placemark];
    }
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if( [[annotation title] isEqualToString:@"Current Location"] ) {
        sleep(5);
        CLLocationCoordinate2D temphold = [annotation coordinate];
        self.currloc = &(temphold);
        return nil;
    }
    
    MKPinAnnotationView *MyPin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:[annotation title]];
    MyPin.pinColor = MKPinAnnotationColorGreen;
    
    //NSLog(@"%@", );
    
    UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    MyPin.rightCalloutAccessoryView = advertButton;
    MyPin.draggable = NO;
    MyPin.highlighted = YES;
    MyPin.animatesDrop=TRUE;
    MyPin.canShowCallout = YES;
    
    return MyPin;
}

-(void)button:(id)sender {
    
    NSArray *selectedpins = [mapView selectedAnnotations];
    WineryAnnotation *currpin = selectedpins[0];
    NSUInteger indexnum = currpin.idnumber;
    RXMLElement *test = [[WineryDatabase Database]wineries][indexnum];
    NSString *title = [test child:@"Winery_Name"].text;
    WineryAddressViewController *addressview = [[WineryAddressViewController alloc]init];
    [self presentViewController:addressview animated:YES completion:nil];
    addressview.wineryname.text = title;
    addressview.address.text = [test child:@"Address"].text;
    NSString *combinedcitystring = [test child:@"City"].text;
    combinedcitystring = [combinedcitystring stringByAppendingString:@", "];
    combinedcitystring = [combinedcitystring stringByAppendingString:[test child:@"State"].text];
    combinedcitystring = [combinedcitystring stringByAppendingString:@" "];
    combinedcitystring = [combinedcitystring stringByAppendingString:[test child:@"Zip"].text];
    addressview.citystatezip.text = combinedcitystring;
    addressview.city = [test child:@"City"].text;
    addressview.state = [test child:@"State"].text;
    addressview.zip = [test child:@"Zip"].text;
    addressview.phone.text = [test child:@"Phone_Number"].text;
    CLLocationCoordinate2D tempcor = currpin.coordinate;
    addressview.winerylocation = &(tempcor);
    [self performSegueWithIdentifier:@"Show Address" sender:self];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
