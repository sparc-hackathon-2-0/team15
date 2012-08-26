//
//  PatientInfoOneViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PatientInfoOneViewController.h"
#import "MyTableCell.h"
#import "GlobalData.h"
#import "PatientInfoTwoViewController.h"



@interface PatientInfoOneViewController ()

@end

@implementation PatientInfoOneViewController
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        patientInfoTwoViewController = [[PatientInfoTwoViewController alloc] initWithNibName:@"PatientInfoTwo" bundle:nil];
        patientInfoTwoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        patientInfoTwoViewController.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    txtEmail.delegate = (id<UITextFieldDelegate>) self;
    txtPassword.delegate = (id<UITextFieldDelegate>) self;
    txtPassword.secureTextEntry = YES;
    txtConfirmPassword.secureTextEntry = YES;
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@""];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier:@""] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        //if ([indexPath section] == 0) {
            UITextField *playerTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 10, 185, 30)];
            playerTextField.adjustsFontSizeToFitWidth = YES;
            playerTextField.textColor = [UIColor blackColor];
       
            //if ([indexPath row] == 0) {
        if ([indexPath row] == 0)
            playerTextField.placeholder = @"First Name";
        if ([indexPath row] == 1)
            playerTextField.placeholder = @"Middle Name";
        else if ([indexPath row] == 2)
            playerTextField.placeholder = @"Last Name";
        else if ([indexPath row] == 3)
            playerTextField.placeholder = @"Social";
        else if ([indexPath row] == 4)
            playerTextField.placeholder = @"Address";
        else if ([indexPath row] == 5)
            playerTextField.placeholder = @"Apartment Address";
        else if ([indexPath row] == 6)
            playerTextField.placeholder = @"State";
        else if ([indexPath row] == 7)
            playerTextField.placeholder = @"City";
        else if ([indexPath row] == 8)
            playerTextField.placeholder = @"Zip";
        else if ([indexPath row] == 9)
            playerTextField.placeholder = @"Email";
        else if ([indexPath row] == 10)
            playerTextField.placeholder = @"Password";
        else if ([indexPath row] == 11)
            playerTextField.placeholder = @"Password Confirm";
        playerTextField.keyboardType = UIKeyboardTypeEmailAddress;
        playerTextField.returnKeyType = UIReturnKeyNext;
            //}
            /*
            else {
                playerTextField.placeholder = @"Required";
                playerTextField.keyboardType = UIKeyboardTypeDefault;
                playerTextField.returnKeyType = UIReturnKeyDone;
                playerTextField.secureTextEntry = YES;
            } */      
            playerTextField.backgroundColor = [UIColor whiteColor];
            playerTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
            playerTextField.autocapitalizationType = UITextAutocapitalizationTypeNone; // no auto capitalization support
            playerTextField.textAlignment = UITextAlignmentLeft;
            playerTextField.tag = 0;
            //playerTextField.delegate = self;
            
            playerTextField.clearButtonMode = UITextFieldViewModeNever; // no clear 'x' button to the right
            [playerTextField setEnabled: YES];
            
            [cell addSubview:playerTextField];
            
            [playerTextField release];
        //}
    }
    return cell;    
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        if(indexPath.row == 0)
        {
            //facebookViewController = [[FacebookViewController alloc] initWithNibName:@"Facebook" bundle:nil];
            //facebookViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            //[self presentModalViewController:facebookViewController animated:YES];
        }
        else if(indexPath.row == 1)
        {
            //lookupEmailForGameVewController = [[LookupEmailForGameViewController alloc] initWithNibName://@"LookupEmailForGame" bundle:nil];
            //lookupEmailForGameVewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            //[self presentModalViewController:lookupEmailForGameVewController animated:YES];
        }
        else if(indexPath.row == 2)
        {
            //[self createRandomGame];
        }
        else if(indexPath.row == 3)
        {
            //[self createRandomGame];
            //[self presentGame];
        }
        else if(indexPath.row == 4)
        {
            //[self dismissModalViewControllerAnimated:YES];
        }
    
    //if(indexPath.section =
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:txtEmail])
   //     [txtName becomeFirstResponder];
    //else if([textField isEqual:txtName])
        [txtPassword becomeFirstResponder];
    else if([textField isEqual:txtPassword])
        [txtConfirmPassword becomeFirstResponder];
    else if([textField isEqual:txtConfirmPassword]) {
        [textField resignFirstResponder];
        [self createAccount];
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if([txtEmail isFirstResponder] && [touch view] != txtEmail)
        [txtEmail resignFirstResponder];
    else if([txtPassword isFirstResponder] && [touch view] != txtPassword)
        [txtPassword resignFirstResponder];
    //else if([txtName isFirstResponder] && [touch view] != txtName)
    //    [txtName resignFirstResponder];
    else if([txtConfirmPassword isFirstResponder] && [touch view] != txtConfirmPassword)
        [txtConfirmPassword resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextView class]])
			[view resignFirstResponder];
	}
}


-(IBAction) goToPatientTwo {
    
    if([self NSStringIsValidEmail:txtEmail.text])
    {
        
        if ([txtPassword.text isEqualToString:txtConfirmPassword.text])
        {
        [[GlobalData sharedGlobalData] setAccEmail:txtEmail.text];
        [[GlobalData sharedGlobalData] setAccPassword:txtPassword.text];
        [self presentModalViewController:patientInfoTwoViewController animated:YES];
        }
        else {
            UIAlertView *passwordMisatch = [[[UIAlertView alloc] initWithTitle:@"Password Mismatch" message:@"The passwords to not match" 
                                                                      delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
            [passwordMisatch setTag:3];
            [passwordMisatch show];
        }
        
    }
    else {
        UIAlertView *invalidEmail = [[[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"Check your entry and try again." 
                                                               delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
        [invalidEmail setTag:1];
        [invalidEmail show];
    }
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}



-(IBAction) goBack {
    
    [self dismissModalViewControllerAnimated:YES];
}





@end
