//
//  InjuredDetailsViewController.h
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InjuredDetailsViewController : UIViewController {
    
    IBOutlet UIImageView *imgDizzy;
    IBOutlet UIImageView *imgBleeding;
    IBOutlet UIImageView *imgBoneShowing;
}

-(IBAction) setDizzy;
-(IBAction) setBleeding;
-(IBAction) setBoneShowing;

@end
