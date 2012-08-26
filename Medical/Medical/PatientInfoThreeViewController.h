//
//  PatientInfoThreeViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HospitalInfoViewControllerViewController.h"
#import "NewAppointmentViewController.h"

@interface PatientInfoThreeViewController : UIViewController {
    
    IBOutlet UITextField *txtInsuranceProv;
    IBOutlet UITextField *txtPlan;
    IBOutlet UITextField *txtPolicyID;
    IBOutlet UITextField *txtPNC;
    
    HospitalInfoViewControllerViewController *hospitalInfoViewController;
    
    NewAppointmentViewController *newAppointmentViewController;
    
    
    NSMutableData *webData;
	NSMutableString *soapResults;
	NSXMLParser *xmlParser;
	BOOL recordResults; 
}

-(IBAction) back;

-(IBAction) goToPatientInfoFour;

-(IBAction) goToPatientInfoFourSaveData;

@end
