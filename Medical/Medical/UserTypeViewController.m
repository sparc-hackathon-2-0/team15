//
//  UserTypeViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserTypeViewController.h"

@interface UserTypeViewController ()

@end

@implementation UserTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    patientInfoOneViewController = [[PatientInfoOneViewController alloc] initWithNibName:@"PatientInfoOne" bundle:nil];
    patientInfoOneViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    patientInfoOneViewController.wantsFullScreenLayout = YES;
    
    loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    loginViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    loginViewController.wantsFullScreenLayout = YES;
    
    doctorViewController = [[DoctorViewController alloc] initWithNibName:@"Doctor" bundle:nil];
    doctorViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    doctorViewController.wantsFullScreenLayout = YES;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *backgroundview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-primary@2x.png"]];
    backgroundview.backgroundColor = background;
    [self.view insertSubview:backgroundview atIndex:0];
    [background release];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction) goToLoginView {
    [self presentModalViewController:loginViewController animated:YES];
    
}
-(IBAction) goToPatientView {
    [self presentModalViewController:patientInfoOneViewController animated:YES];
}
-(IBAction) goToNurseView {
    
}-(IBAction) goToDoctorView {
    [self presentModalViewController:doctorViewController animated:YES];
    
}


@end
