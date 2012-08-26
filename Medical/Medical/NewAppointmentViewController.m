//
//  NewAppointmentViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewAppointmentViewController.h"

@interface NewAppointmentViewController ()

@end

@implementation NewAppointmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        checkupViewController = [[CheckupViewController alloc] initWithNibName:@"Checkup" bundle:nil];
        checkupViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        checkupViewController.wantsFullScreenLayout = YES;
        
        injuredViewConroller = [[InjuredViewController alloc] initWithNibName:@"Injured" bundle:nil];
        injuredViewConroller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        injuredViewConroller.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"appointment loaded");
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

- (IBAction) goToCheckup {
    [self presentModalViewController:checkupViewController animated:YES];
    
}
- (IBAction) goToFeelingIll {
    
}
- (IBAction) goToInjured {
    [self presentModalViewController:injuredViewConroller animated:YES];
}

- (IBAction) logOut {

    
    
}

@end
