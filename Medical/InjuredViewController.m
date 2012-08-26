//
//  InjuredViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InjuredViewController.h"

@interface InjuredViewController ()

@end

@implementation InjuredViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        injuredDetailsViewController = [[InjuredDetailsViewController alloc] initWithNibName:@"InjuredDetails" bundle:nil];
        injuredDetailsViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        injuredDetailsViewController.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad
{
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

-(IBAction) saveInjured {
    
    [self presentModalViewController:injuredDetailsViewController animated:YES];
    
}

@end
