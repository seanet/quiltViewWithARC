//
//  AppDelegate.m
//  QuiltText
//
//  Created by zhaoqihao on 10/25/14.
//  Copyright (c) 2014 com.zhaoqihao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *vc=[[ViewController alloc]init];
    [self.window setRootViewController:vc];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
