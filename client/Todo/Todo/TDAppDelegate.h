//
//  TDAppDelegate.h
//  Todo
//
//  Created by Jacob Morris on 3/18/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (strong, nonatomic) IBOutlet UITabBarController *tabBarController;

@end
