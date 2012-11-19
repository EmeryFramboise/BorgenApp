//
//  Annotation.h
//  Borgen
//
//  Created by Tom Offringa on 11/14/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;


@end
