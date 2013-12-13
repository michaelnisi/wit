//
//  AppDelegate.m
//  example
//
//  Created by Michael Nisi on 22.11.13.
//  Copyright (c) 2013 Michael Nisi. All rights reserved.
//

#import "AppDelegate.h"
#import <wit/wit.h>

@implementation AppDelegate

- (BOOL)
application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    wit_install();
    return YES;
}

@end
