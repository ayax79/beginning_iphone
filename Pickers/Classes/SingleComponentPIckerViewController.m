//
//  SingleComponentPIckerViewController.m
//  Pickers
//
//  Created by Andrew Wright on 1/5/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "SingleComponentPIckerViewController.h"


@implementation SingleComponentPIckerViewController
@synthesize singlePicker;
@synthesize pickerData;

- (IBAction)buttonPrseed {
	NSInteger row = [singlePicker selectedRowInComponent:0];
	NSString *selected = [pickerData objectAtIndex:row];
	NSString *title = [[NSString alloc] initWithFormat:@"You selected %@", selected];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title 
													message:@"Thank you for choosing" 
												   delegate:nil 
										  cancelButtonTitle:@"You're Welcome" 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	[title release];	
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia",
					  @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando", nil];
	self.pickerData = array;
	[array release];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	self.singlePicker = nil;
	self.pickerData = nil;
    [super viewDidUnload];
}

- (void)dealloc {
	[singlePicker release];
	[pickerData release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
		numberOfRowsInComponent:(NSInteger)component {
	return [pickerData count];	
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
			 titleForRow:(NSInteger)row
			forComponent:(NSInteger)component {
	return [pickerData objectAtIndex:row];
}

@end
