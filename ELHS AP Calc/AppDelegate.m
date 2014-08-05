//
//  AppDelegate.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 6/29/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//



#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <sys/utsname.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    [Parse setApplicationId:@"Z3T4v6PoKP78FXu9qyyuoLvq9SbOd7Z1dptwGenI"
                  clientKey:@"5WYuDH5xn89Sqqe1noKgUjVx112sA0lBWecXVO1d"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    return YES;
}



- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:newDeviceToken];
    [currentInstallation setObject:[[UIDevice currentDevice] name] forKey:@"deviceName"];
    [currentInstallation setObject:@"yes" forKey:@"cangetpush"];
    [currentInstallation setObject:[[UIDevice currentDevice] systemVersion] forKey:@"systemVersion"];
    
    
    
    //get the device type
    //*IMPORT* <sys/utsname.h>
    struct utsname systemInfo;
    uname(&systemInfo);
    //NSString *deviceType = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    [currentInstallation setObject:[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding] forKey:@"hardwareType"];
    [currentInstallation saveInBackground];
    
    NSLog(@"Registered for Push. Analytics logged");
    
}



- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    
    [[[UIAlertView alloc] initWithTitle:@"New Message" message:[NSString stringWithFormat:@"There is a new message. Please refresh news section."] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
