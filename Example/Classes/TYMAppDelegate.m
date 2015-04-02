//
//  AppDelegate.m
//  TYMProgressBarView
//
//  Created by Yiming Tang on 13-6-7.
//  Copyright (c) 2013 - 2014 Yiming Tang. All rights reserved.
//

#import "TYMAppDelegate.h"
#import "TYMViewController.h"

@implementation TYMAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[TYMViewController alloc] init];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
