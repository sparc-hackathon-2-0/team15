//
//  CheckupViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CheckupViewController.h"

@interface CheckupViewController ()

@end

@implementation CheckupViewController
@synthesize datePicker;

@synthesize datelabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    imgSpecialist.hidden = YES;
    picker.hidden = YES;
    datePicker.hidden = YES;
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //gynacologist, pediatrician, opthamologist, ...
    
    if( row == 0)
        return @"Pediatrician";
    else if( row == 1)
        return @"Opthamologist";
    else if( row == 2)
        return @"Gynacologist";
}

-(IBAction) presentDate {
    datePicker.hidden = NO;
	
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	datelabel.text = [NSString stringWithFormat:@"%@",
                      [df stringFromDate:[NSDate date]]];
	[df release];
	[self.view addSubview:datelabel]; 
	[datelabel release];
	
	
	datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 325, 300)];
	datePicker.datePickerMode = UIDatePickerModeDate;
	datePicker.hidden = NO;
	datePicker.date = [NSDate date];
    
	[datePicker addTarget:self
	               action:@selector(LabelChange:)
	     forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:datePicker];
    [datePicker release];
}

- (void)LabelChange:(id)sender{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
   	df.dateStyle = NSDateFormatterMediumStyle;
	datelabel.text = [NSString stringWithFormat:@"%@",
                      [df stringFromDate:datePicker.date]];
    NSLog([NSString stringWithFormat:@"%@",
           [df stringFromDate:datePicker.date]]);
    datePicker.hidden = YES;
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

-(IBAction) createAppointment {
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    UIAlertView *serverError = [[[UIAlertView alloc] initWithTitle:@"Done!" message:@"Your Appointment has been scheduled." 
                                                          delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
    [serverError setTag:3];
    [serverError show];
    
}

-(IBAction) selectPrimaryCare {
    
    imgSpecialist.hidden = YES;
    imgPrimaryCare.hidden = NO;
}

-(IBAction) presentSpecialist {
    picker.hidden = NO;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    picker.hidden = YES;
    [pickerView resignFirstResponder];
    
    imgSpecialist.hidden = NO;
    imgPrimaryCare.hidden = YES;
}

@end
