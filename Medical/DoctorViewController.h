//
//  DoctorViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorViewController : UIViewController {
    
    NSMutableData *webData;
	NSMutableString *soapResults;
	NSXMLParser *xmlParser;
	BOOL recordResults;
    
    NSMutableArray *hospitalNameList;
	NSMutableArray *doctorNameList;
    NSMutableArray *dateTimeList;
    NSMutableArray *patientList;
    NSMutableArray *appiontmentTypeList;
    NSMutableArray *symptomTypeList;
    
    IBOutlet UITableView *appointmentList;
}


@property (retain) IBOutlet UITableView *appointmentList;

@end
