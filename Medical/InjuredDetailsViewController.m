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
