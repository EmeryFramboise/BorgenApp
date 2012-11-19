//
//  FirstViewController.m
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import "FirstViewController.h"
#import "Annotation.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Locaties", @"Locaties");
        self.tabBarItem.image = [UIImage imageNamed:@"location"];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation *allAnnotations;
    
    //Allersmaborg
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.4526737;
    location.latitude = 53.3191011;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Allersmaborg";
    allAnnotations.subtitle = @"Ezinge, Groningen (15e eeuw)";
    [locations addObject:allAnnotations];
    
    //Coendersborg
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.5887246;
    location.latitude = 53.1951999;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Coendersborg";
    allAnnotations.subtitle = @"Marum, Groningen (15e eeuw)";
    [locations addObject:allAnnotations];
    
    //Ennemaborg
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.9993383;
    location.latitude = 53.1931219;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Ennemaborg";
    allAnnotations.subtitle = @"Midwolda, Groningen (13e eeuw)";
    [locations addObject:allAnnotations];
    
    //Ewsum
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.6465298;
    location.latitude = 53.3534722;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Geschutskoepel Ewsum";
    allAnnotations.subtitle = @"Middelstum, Groningen (1472)";
    [locations addObject:allAnnotations];
    
    //Fraeylemaborg
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.8064344;
    location.latitude = 53.2157701;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Fraeylemaborg";
    allAnnotations.subtitle = @"Slochteren, Groningen (13e eeuw)";
    [locations addObject:allAnnotations];
    
    //Iwema-Steenhuis
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.3258632;
    location.latitude = 53.1568735;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Iwema-Steenhuis";
    allAnnotations.subtitle = @"Westerkwartier, Groningen (rond 1400)";
    [locations addObject:allAnnotations];
    
    //Menkemaborg
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.6838609;
    location.latitude = 53.4050193;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Menkemaborg";
    allAnnotations.subtitle = @"Uithuizen, Groningen (begin 15e eeuw)";
    [locations addObject:allAnnotations];
    
    //Nienoord
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.3962968;
    location.latitude = 53.1666175;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Nienoord";
    allAnnotations.subtitle = @"Leek, Groningen (1525)";
    [locations addObject:allAnnotations];
    
    //Pieloersemaborg
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.39715;
    location.latitude = 53.2441972;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Pieloersema";
    allAnnotations.subtitle = @"Zuidhorn, Groningen (1448)";
    [locations addObject:allAnnotations];
    
    //Rusthoven
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.801633;
    location.latitude = 53.318143;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Rusthoven";
    allAnnotations.subtitle = @"Loppersum, Groningen (1686)";
    [locations addObject:allAnnotations];
    
    //Verhildersum
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.3930302;
    location.latitude = 53.3625132;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Verhildersum";
    allAnnotations.subtitle = @"De Marne, Groningen (1514)";
    [locations addObject:allAnnotations];
    
    //Welgelegen
    allAnnotations = [[Annotation alloc] init];
    location.longitude = 6.7973227;
    location.latitude = 53.1546638;
    allAnnotations.coordinate = location;
    allAnnotations.title = @"Welgelegen";
    allAnnotations.subtitle = @"Hoogezand-Sappemeer, Groningen (1514)";
    [locations addObject:allAnnotations];
    
    
  
    [self.mapView addAnnotations:locations];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [self.mapView setShowsUserLocation:YES];
    
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id<MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate] ,32500,29500);
    
    [mv setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end