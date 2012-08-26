//
//  CheckupViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckupViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    
    IBOutlet UIPickerView *picker;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UILabel *datelabel;
    IBOutlet UIButton *btnSpecialist;
    
    IBOutlet UIImageView *imgPrimaryCare;
    IBOutlet UIImageView *imgSpecialist;
    
    
}

-(IBAction) presentSpecialist;

-(IBAction) presentDate;

-(IBAction) createAppointment;

-(IBAction) selectPrimaryCare;

@property(nonatomic, retain) IBOutlet UIPickerView *picker;
@property(nonatomic,retain) UIDatePicker *datePicker;
@property(nonatomic,retain) IBOutlet UILabel *datelabel;

@end
