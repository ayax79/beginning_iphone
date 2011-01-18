//
//  PresidentDetailController.m
//  Nav
//
//  Created by Eric Hayes on 5/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PresidentDetailController.h"
#import "President.h"
#import "NavAppDelegate.h"

@implementation PresidentDetailController
@synthesize president;
@synthesize fieldLabels;
@synthesize tempValues;
@synthesize textFieldBeingEdited;

-(IBAction)cancel:(id)sender {
	NavAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.navController popViewControllerAnimated:YES];
}

-(IBAction)save:(id)sender {
	if ( textFieldBeingEdited != nil ) {
		NSNumber *tagAsNum = [[NSNumber alloc] initWithInt:textFieldBeingEdited.tag];
		[tempValues setObject:textFieldBeingEdited.text forKey:tagAsNum];
		[tagAsNum release];
	}
	
	for ( NSNumber *key in [tempValues allKeys] ) {
		switch ([key intValue]) {
			case kNameField:
				president.name = [tempValues objectForKey:key];
				break;
				
			case kFromField:
				president.fromYear = [tempValues objectForKey:key];
				break;
				
			case kToField:
				president.toYear = [tempValues objectForKey:key];
				break;
				
			case kPartyField:
				president.party = [tempValues objectForKey:key];
				break;
				
		}
	}
	
	NavAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	UINavigationController *navController = [delegate navController];
	[navController popViewControllerAnimated:YES];
	
	NSArray *allControllers = navController.viewControllers;
	UITableViewController *parent = [allControllers lastObject];
	[parent.tableView reloadData];
}

-(IBAction)textFieldDone:(id)sender {
	[sender resignFirstResponder];
}

-(void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"Name:", @"From:", @"To:", @"Party:", nil];
	self.fieldLabels = array;
	[array release];
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
									 initWithTitle:@"Cancel"
									 style:UIBarButtonItemStylePlain
									 target:self
									 action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
								   initWithTitle:@"Save" 
								   style:UIBarButtonItemStyleDone
								   target:self 
								   action:@selector(save:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];
	
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	self.tempValues = dict;
	[dict release];
	
	[super viewDidLoad];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[textFieldBeingEdited release];
	[tempValues release];
	[president release];
	[fieldLabels release];
	
	[super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return kNumFields;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *ident = @"prescellident";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
	if ( cell == nil ) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:ident] autorelease];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,10,75,25)];
		label.textAlignment = UITextAlignmentRight;
		label.tag = kLabelTag;
		label.font = [UIFont boldSystemFontOfSize:14];
		[cell.contentView addSubview:label];
		[label release];
		
		UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 12, 200, 25)];
		textField.clearsOnBeginEditing = NO;
		[textField setDelegate:self];
		textField.returnKeyType = UIReturnKeyDone;
		[textField addTarget:self
					  action:@selector(textFieldDone:) 
			forControlEvents:UIControlEventEditingDidEndOnExit];
		
		[cell.contentView addSubview:textField];
	}
	
	NSUInteger row = [indexPath row];
	
	UILabel *label = (UILabel *)[cell viewWithTag:kLabelTag];
	UITextField *textField = nil;
	
	for ( UIView *oneView in cell.contentView.subviews ) {
		if ( [oneView isMemberOfClass:[UITextField class]] ) {
			textField = (UITextField *)oneView;
		}
	}
	
	label.text = [fieldLabels objectAtIndex:row];
	NSNumber *rowAsNum = [[NSNumber alloc] initWithInt:row];
	
	switch ( row ) {
		case kNameField:
			if ( [[tempValues allKeys] containsObject:rowAsNum] ) {
				textField.text = [tempValues objectForKey:rowAsNum];
			} else {
				textField.text = president.name;
			}
			break;
			
		case kFromField:
			if ( [[tempValues allKeys] containsObject:rowAsNum] ) {
				textField.text = [tempValues objectForKey:rowAsNum];
			} else {
				textField.text = president.fromYear;
			}
			break;
			
		case kToField:
			if ( [[tempValues allKeys] containsObject:rowAsNum] ) {
				textField.text = [tempValues objectForKey:rowAsNum];
			} else {
				textField.text = president.toYear;
			}
			break;
			
		case kPartyField:
			if ( [[tempValues allKeys] containsObject:rowAsNum] ) {
				textField.text = [tempValues objectForKey:rowAsNum];
			} else {
				textField.text = president.party;
			}
			break;
	}
	
	if ( textFieldBeingEdited == textField ) {
		textFieldBeingEdited = nil;
	}
	
	textField.tag = row;
	[rowAsNum release];
	
	return cell;
}




- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	self.textFieldBeingEdited = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	NSNumber *tagAsNum = [[NSNumber alloc] initWithInt:textField.tag];
	[tempValues setObject:textField forKey:tagAsNum];
	[tagAsNum release];
}

@end
