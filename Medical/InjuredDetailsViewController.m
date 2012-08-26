//
//  InjuredDetailsViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InjuredDetailsViewController.h"

@interface InjuredDetailsViewController ()

@end

@implementation InjuredDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction) setDizzy {
    imgDizzy.hidden = NO;
    imgBleeding.hidden = YES;
    imgBoneShowing.hidden = YES;
    
}
-(IBAction) setBleeding {
    imgDizzy.hidden = YES;
    imgBleeding.hidden = NO;
    imgBoneShowing.hidden = YES;
    
}
-(IBAction) setBoneShowing {
    
    imgDizzy.hidden = YES;
    imgBleeding.hidden = YES;
    imgBoneShowing.hidden = NO;
}

-(IBAction) back {
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) save {

    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    UIAlertView *serverError = [[[UIAlertView alloc] initWithTitle:@"Done!" message:@"Your Appointment has been scheduled." 
                                                          delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
    [serverError setTag:3];
    [serverError show];
    
}

-(void)alertView:(UIAlertView *) alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if([alertView tag] == 3)
    {
        if(buttonIndex == 0)
        {
            [self dismissModalViewControllerAnimated:YES];
        }
    }
}


- (void)viewDidLoad
{
    
    imgDizzy.hidden = NO;
    imgBleeding.hidden = YES;
    imgBoneShowing.hidden = YES;
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

@end
