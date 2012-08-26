//
//  InjuredViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InjuredDetailsViewController.h"

@interface InjuredViewController : UIViewController {
    
    InjuredViewController *injuredViewController;
    InjuredDetailsViewController *injuredDetailsViewController;
    
    IBOutlet UIButton *head;
    IBOutlet UIButton *leftshoulder;
    IBOutlet UIButton *rightshoulder;
    IBOutlet UIButton *chest;
    IBOutlet UIButton *leftelbow;
    IBOutlet UIButton *rightelbow;
    IBOutlet UIButton *groin;
    IBOutlet UIButton *lefthand;
    IBOutlet UIButton *righthand;
    
    IBOutlet UIButton *leftknee;
    IBOutlet UIButton *rightknee;
    
    IBOutlet UIButton *leftfoot;
    IBOutlet UIButton *rightfoot;
    
}

-(IBAction) saveInjured;


@end
