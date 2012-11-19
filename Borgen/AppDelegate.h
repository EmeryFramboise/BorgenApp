//
//  AppDelegate.h
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) ViewController *viewController;

-(void)customizeAppearance;

@end

