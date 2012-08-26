//
//  PatientInfoThreeViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PatientInfoThreeViewController.h"
#import "GlobalData.h"
#import "HospitalInfoViewControllerViewController.h"

@interface PatientInfoThreeViewController ()

@end

@implementation PatientInfoThreeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        newAppointmentViewController = [[NewAppointmentViewController alloc] initWithNibName:@"NewAppointment" bundle:nil];
        newAppointmentViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        newAppointmentViewController.wantsFullScreenLayout = YES;

    }
    return self;
}

- (void)viewDidLoad
{
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([txtInsuranceProv isEqual:txtInsuranceProv])
        [txtPlan becomeFirstResponder];
    else if([textField isEqual:txtPlan])
        [txtPolicyID becomeFirstResponder];
    else if([textField isEqual:txtPolicyID])
        [txtPNC becomeFirstResponder];
    else if([textField isEqual:txtPNC]) {
        [txtPNC resignFirstResponder];
        //[self createAccount];
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if([txtInsuranceProv isFirstResponder] && [touch view] != txtInsuranceProv)
        [txtInsuranceProv resignFirstResponder];
    else if([txtPlan isFirstResponder] && [touch view] != txtPlan)
        [txtPlan resignFirstResponder];
    else if([txtPolicyID isFirstResponder] && [touch view] != txtPolicyID)
        [txtPolicyID resignFirstResponder];
    else if([txtPNC isFirstResponder] && [touch view] != txtPNC)
        [txtPNC resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

-(IBAction) back {
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) goToPatientInfoFour {
    //[self createUser];
    [self presentModalViewController:newAppointmentViewController animated:YES];
   //[self presentModalViewController:newAppointmentViewController animated:YES];
    
}

-(void) createUser {
    //[[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    //[loading startAnimating];
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-16\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<AddPatient xmlns=\"http://tempuri.org/\">\n"
                             "<FirstName>%@</FirstName>\n"
                             "<MiddleName>%@</MiddleName>\n"
                             "<LastName>%@</LastName>\n"
                             "<social>%@</social>\n"
                             "<StreetAddress>%@</StreetAddress>\n"
                             "<ApartmentAddress>%@</ApartmentAddress>\n"
                             "<State>%@</State>\n"
                             "<City>%@</City>\n"
                             "<Zip>%@</Zip>\n"
                             "<email>%@</email>\n"
                             "<password>%@</password>\n"
                             "<InsuranceProvider>%@</InsuranceProvider>\n"
                             "<Plan>%@</Plan>\n"
                             "<PolicyID>%@</PolicyID>\n"
                             "<PNC>%@</PNC>\n"
                             "</AddPatient>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n"
                             , 
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123",
                             @"123"
                             ];
    NSURL *url = [NSURL URLWithString:[[GlobalData sharedGlobalData] getServiceURL]];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"http://tempuri.org/AddPatient" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        webData = [[NSMutableData data] retain];
    }
    else
    {
        //NSLog(@"theConnection is NULL");
    }

}




-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[connection release];
	[webData release];
    //[[UIApplication sharedApplication] endIgnoringInteractionEvents];
    //[loading stopAnimating];
    UIAlertView *alertConnectionError = [[[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Please check your internet connection and try again." 
                                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
    [alertConnectionError setTag:3];
    [alertConnectionError show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	//NSLog(@"DONE. Received Bytes: %d", [webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(theXML);
	[theXML release];
	if( xmlParser )
	{
		[xmlParser release];
	}
	xmlParser = [[NSXMLParser alloc] initWithData: webData];
	[xmlParser setDelegate: (id <NSXMLParserDelegate>) self];
	[xmlParser setShouldResolveExternalEntities: YES];
	[xmlParser parse];
	[connection release];
	[webData release];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    
    if( [elementName isEqualToString:@"u"])
	{
		if(!soapResults)
		{
			soapResults = [[NSMutableString alloc] init];
		}
		recordResults = TRUE;
	}
    
    else if([elementName isEqualToString:@"eo"])
	{
		if(!soapResults)
		{
			soapResults = [[NSMutableString alloc] init];
		}
		recordResults = TRUE;
	}
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if(recordResults)
	{
		[soapResults appendString: string];
	}
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    
    if([elementName isEqualToString:@"u"])
	{
        
        if([soapResults isEqualToString:@"-1"])
        {
            
        }
        else {//successful login.
            [[GlobalData sharedGlobalData] setUserID:soapResults];
        }
        
        
		recordResults = FALSE;
		[soapResults release];
		soapResults = nil;
	}
    
    else if([elementName isEqualToString:@"eo"])
	{
        //serverError = TRUE;
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        UIAlertView *serverError = [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"An error has occured on the server. Please check back again later!" 
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
        [serverError setTag:3];
        [serverError show];
        
		recordResults = FALSE;
		[soapResults release];
		soapResults = nil;
	}
    
	
	//End of the soap XML Document
	else if([elementName isEqualToString:@"soap:Envelope"]) {
        [self presentModalViewController:newAppointmentViewController animated:YES];
        
        //[[UIApplication sharedApplication] endIgnoringInteractionEvents];
        //[loading stopAnimating];
		
		recordResults = FALSE;
		[soapResults release];
		soapResults = nil;
	}
    
}


-(IBAction) goToPatientInfoFourSaveData {
    
    //crate user;
    [self presentModalViewController:newAppointmentViewController animated:YES];
    //[self createUser];
    
    [[GlobalData sharedGlobalData] setTxtPNC:txtPNC.text];
    [[GlobalData sharedGlobalData] setTxtPlan:txtPlan.text];
    [[GlobalData sharedGlobalData] setTxtPolicyID:txtPolicyID.text];
    [[GlobalData sharedGlobalData] setTxtInsuranceProv:txtInsuranceProv.text];
    
    
    
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextView class]])
			[view resignFirstResponder];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
