//
//  LoginViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorViewController.h"

@interface LoginViewController : UIViewController {
    DoctorViewController *doctorViewController;
    
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPassword;
}

-(IBAction)login;

@end
