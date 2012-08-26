//
//  NewAppointmentViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckupViewController.h"
#import "InjuredViewController.h"

@interface NewAppointmentViewController : UIViewController {
    
    CheckupViewController *checkupViewController;
    InjuredViewController *injuredViewConroller;
    
    
}

- (IBAction) logOut;

- (IBAction) goToCheckup;
- (IBAction) goToFeelingIll;
- (IBAction) goToInjured;


@end
