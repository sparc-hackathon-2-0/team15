//
//  GlobalData.m
//  Hawkes
//
//  Created by HLS on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GlobalData.h"


@implementation GlobalData
@synthesize accEmail;
@synthesize accPassword;
@synthesize firstName;
@synthesize lastName;
@synthesize address;
@synthesize city;
@synthesize state;

@synthesize txtPNC;
@synthesize txtPlan;
@synthesize txtInsuranceProv;
@synthesize txtPolicyID;
@synthesize userID;

//@synthesize hasGameLocalBeenPresented;

static GlobalData *sharedGlobalData = nil;

+ (GlobalData*)sharedGlobalData {
	if (sharedGlobalData == nil) {
		sharedGlobalData = [[super allocWithZone:NULL] init];
		//sharedGlobalData.studentID = @"";
        
	}
	return sharedGlobalData;
}

+ allocWithZone:(NSZone*)zone {
	@synchronized(self) {
		if(sharedGlobalData == nil) {
			sharedGlobalData = [super allocWithZone:zone];
			return sharedGlobalData;
		}
	}
	return nil;
}

- (id) copyWithZone:(NSZone*)zone {
	return self;
}


-(NSString *)getServiceURL {
    return @"http://www.therealestaterag.com/Hex/MedicalService.asmx";
}


@end
