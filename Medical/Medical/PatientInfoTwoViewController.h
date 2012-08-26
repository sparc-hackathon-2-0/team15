//
//  PatientInfoTwoViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientInfoThreeViewController.h"

@interface PatientInfoTwoViewController : UIViewController
{
    IBOutlet UITextField *txtFirstName;
    IBOutlet UITextField *txtLastName;
    IBOutlet UITextField *txtAddress;
    IBOutlet UITextField *txtState;
    IBOutlet UITextField *txtCity;
    
    PatientInfoThreeViewController *patientInfoThreeViewController;

}

-(IBAction) goToPatientThree;

-(IBAction) back;


@end
