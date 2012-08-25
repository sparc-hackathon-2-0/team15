//
//  AppDelegate.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserTypeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    UserTypeViewController *userTypeViewController;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UserTypeViewController *userTypeViewController;

@end
