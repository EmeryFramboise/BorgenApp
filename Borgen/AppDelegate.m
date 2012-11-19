//
//  AppDelegate.m
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

#import "SecondViewController.h"

#import "ThirdViewController.h"

#import "DetailViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    [self customizeAppearance];

    [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
    

    
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    
    UIViewController *viewController2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
    UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:viewController2] autorelease];
    
    UIViewController *viewController3 = [[[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil] autorelease];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, navigationController, viewController3, nil];
    
    // Custom tabbar met plaatjes
    [[[self tabBarController] tabBar] setBackgroundImage:[UIImage imageNamed:@"customtabbar.png"]];
    [[[self tabBarController] tabBar] setSelectionIndicatorImage:[UIImage imageNamed:@"customtabbarpressed.png"]];
    
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];
    

    
    return YES;

}

-(void)customizeAppearance
{
    UIImage *customBackground = [UIImage imageNamed:@"titlebar2.png"];
        
    [[UINavigationBar appearance] setBackgroundImage:customBackground forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleBarAttributes setValue:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:18] forKey:UITextAttributeFont];
    [[UINavigationBar appearance] setTitleTextAttributes:titleBarAttributes];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary: [[UIBarButtonItem appearance] titleTextAttributesForState:UIControlStateNormal]];
    [attributes setValue:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] forKey:UITextAttributeFont];
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
