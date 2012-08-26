//
//  GlobalData.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalData : NSObject {
    
    
    NSString *accEmail;
    NSString *accPassword;
    
    NSString *firstName;
    NSString *lastName;
    NSString *address;
    NSString *city;
    NSString *state;
    
    NSString *txtInsuranceProv;
    NSString *txtPlan;
    NSString *txtPolicyID;
    NSString *txtPNC;
    
    NSString *userID;



    
}

+ (GlobalData*)sharedGlobalData;

-(NSString *)getServiceURL;

@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSString *accEmail;
@property (nonatomic, retain) NSString *accPassword;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;

@property (nonatomic, retain) NSString *txtInsuranceProv;
@property (nonatomic, retain) NSString *txtPlan;
@property (nonatomic, retain) NSString *txtPolicyID;
@property (nonatomic, retain) NSString *txtPNC;

@end
