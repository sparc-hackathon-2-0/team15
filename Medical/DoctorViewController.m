//
//  DoctorViewController.m
//  Medical
//
//  Created by Jordan Homan on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DoctorViewController.h"
#import "MyTableCell.h"
#import "GlobalData.h"

@interface DoctorViewController ()

@end

@implementation DoctorViewController
@synthesize appointmentList;

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
    [self.appointmentList setDelegate:self];
    [self.view addSubview:appointmentList];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated {   
    
    hospitalNameList = [[NSMutableArray alloc] init];
    doctorNameList = [[NSMutableArray alloc] init];
    dateTimeList = [[NSMutableArray alloc] init];
    patientList  = [[NSMutableArray alloc] init];
    appiontmentTypeList = [[NSMutableArray alloc] init];
    symptomTypeList = [[NSMutableArray alloc] init];
    
    
    
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-16\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetAppointment xmlns=\"http://tempuri.org/\">\n"
                             "</GetAppointment>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n"
                             
                             ];
    NSURL *url = [NSURL URLWithString:[[GlobalData sharedGlobalData] getServiceURL]];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"http://tempuri.org/GetAppointment" forHTTPHeaderField:@"SOAPAction"];
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
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    UIAlertView *alertConnectionError = [[[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Please check your internet connection and try again." 
                                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
    [alertConnectionError setTag:3];
    [alertConnectionError show];
    
    //[loading stopAnimating];
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
    
    if([elementName isEqualToString:@"a"])
	{
        NSString *attributeName = [attributeDict objectForKey:@"Hospital"];
		if(attributeName) {
            [hospitalNameList addObject:attributeName];
			attributeName = nil;
			[attributeName release];
		}
        attributeName = [attributeDict objectForKey:@"Doctor"];
		if(attributeName) {
            [doctorNameList addObject:attributeName];
			attributeName = nil;
			[attributeName release];
		}
        attributeName = [attributeDict objectForKey:@"DateTime"];
		if(attributeName) {
            [dateTimeList addObject:attributeName];
			attributeName = nil;
			[attributeName release];
		}
        attributeName = [attributeDict objectForKey:@"Patient"];
		if(attributeName) {
            [patientList addObject:attributeName];
			attributeName = nil;
			[attributeName release];
		}
        attributeName = [attributeDict objectForKey:@"Appointment"];
		if(attributeName) {
            [appiontmentTypeList addObject:attributeName];
			attributeName = nil;
			[attributeName release];
		}
        attributeName = [attributeDict objectForKey:@"Symptoms"];
		if(attributeName) {
            [symptomTypeList addObject:attributeName];
			attributeName = nil;
			[attributeName release];
		}
    }
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{	
    
    if([elementName isEqualToString:@"a"])
	{
		recordResults = FALSE;
		[soapResults release];
		soapResults = nil;
	}
    
	//End of the soap XML Document
	else if([elementName isEqualToString:@"soap:Envelope"]) {
        NSLog(@"data received");
        [self.appointmentList reloadData];
        [appointmentList reloadData];
        
	}
    
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView {
    return  1;
}

- (NSInteger*) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    //if(section == 0)
    NSLog([NSString stringWithFormat:@"%d", [symptomTypeList  count]]);
    return [symptomTypeList  count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    //     return 60.0;
    // else
    return 40.0;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if(recordResults)
	{
		[soapResults appendString: string];
	}
}


- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	MyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[MyTableCell alloc] initWithFrame:CGRectZero] autorelease];
	}
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0, 320.0, tableView.rowHeight)] autorelease];
    label = [[[UILabel alloc] initWithFrame:CGRectMake(30.0, 0, 225.0, tableView.rowHeight)] autorelease];
    label.font = [UIFont systemFontOfSize:12.0];
    
    label.text = [patientList objectAtIndex:indexPath.row];
    [label setLineBreakMode:UILineBreakModeWordWrap];
    [label setNumberOfLines:2];
    label.textAlignment = UITextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:label];
    
   	return cell;
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
