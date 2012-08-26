//
//  UserTypeViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientInfoOneViewController.h"
#import "LoginViewController.h"

@interface UserTypeViewController : UIViewController {
    
    LoginViewController *loginViewController;
    PatientInfoOneViewController *patientInfoOneViewController;
    
}

-(IBAction) goToLoginView;
-(IBAction) goToPatientView;
-(IBAction) goToNurseView;
-(IBAction) goToDoctorView;

@end
