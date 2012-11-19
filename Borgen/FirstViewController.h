//
//  FirstViewController.h
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController <UIApplicationDelegate,CLLocationManagerDelegate,MKMapViewDelegate,UITextFieldDelegate> {
CLLocationManager *locationManager;
IBOutlet MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) IBOutlet MKMapView *mapView;

@end