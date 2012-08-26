//
//  LoginViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
        doctorViewController = [[DoctorViewController alloc] initWithNibName:@"Doctor" bundle:nil];
        doctorViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        doctorViewController.wantsFullScreenLayout = YES;
        
        
        
    
    }
    return self;
}

- (void)viewDidLoad
{
    txtPassword.secureTextEntry = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)login {
    
    [self presentModalViewController:doctorViewController animated:YES];
}

-(IBAction)back {
    [self dismissModalViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if([txtEmail isFirstResponder] && [touch view] != txtEmail)
        [txtEmail resignFirstResponder];
    if([txtPassword isFirstResponder] && [touch view] != txtPassword)
        [txtPassword resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextView class]])
			[view resignFirstResponder];
	}
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

@end
