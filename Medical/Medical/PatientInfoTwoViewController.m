//
//  PatientInfoTwoViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PatientInfoTwoViewController.h"
#import "GlobalData.h"

@interface PatientInfoTwoViewController ()

@end

@implementation PatientInfoTwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        patientInfoThreeViewController = [[PatientInfoThreeViewController alloc] initWithNibName:@"PatientInfoThree" bundle:nil];
        patientInfoThreeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        patientInfoThreeViewController.wantsFullScreenLayout = YES;

    }
    return self;
}

- (void)viewDidLoad
{
    UIView *backgroundview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-primary@2x.png"]];
    backgroundview.backgroundColor = background;
    [self.view insertSubview:backgroundview atIndex:0];
    [background release];
    
    [super viewDidLoad];
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:txtFirstName])
        [txtLastName becomeFirstResponder];
    else if([textField isEqual:txtLastName])
        [txtAddress becomeFirstResponder];
    else if([textField isEqual:txtAddress])
        [txtCity becomeFirstResponder];
    else if([textField isEqual:txtCity]) {
        [txtState resignFirstResponder];
        //[self createAccount];
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if([txtFirstName isFirstResponder] && [touch view] != txtFirstName)
        [txtFirstName resignFirstResponder];
    else if([txtLastName isFirstResponder] && [touch view] != txtLastName)
        [txtLastName resignFirstResponder];
    else if([txtAddress isFirstResponder] && [touch view] != txtAddress)
        [txtAddress resignFirstResponder];
    else if([txtCity isFirstResponder] && [touch view] != txtCity)
        [txtCity resignFirstResponder];
    else if([txtState isFirstResponder] && [touch view] != txtState)
        [txtState resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextView class]])
			[view resignFirstResponder];
	}
}

-(IBAction) back {
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) goToPatientThree {
    
    [[GlobalData sharedGlobalData] setFirstName:txtFirstName.text];
    [[GlobalData sharedGlobalData] setLastName:txtLastName.text];
    [[GlobalData sharedGlobalData] setAddress:txtAddress.text];
    [[GlobalData sharedGlobalData] setCity:txtCity.text];
    [[GlobalData sharedGlobalData] setState:txtState.text];
    
    [self presentModalViewController:patientInfoThreeViewController animated:YES];
    
}



@end
