//
//  PatientInfoOneViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientInfoTwoViewController.h"


@interface PatientInfoOneViewController : UIViewController {
    
    IBOutlet UITableView *tableView;
    
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtConfirmPassword;
    
    PatientInfoTwoViewController *patientInfoTwoViewController;

}

-(IBAction) goBack;
-(IBAction) goToPatientTwo;



@property (retain) IBOutlet UITableView *tableView;

@end
