//
//  Simple_TableViewController.m
//  Simple Table
//
//  Created by Andrew Wright on 1/8/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "Simple_TableViewController.h"

@implementation Simple_TableViewController
@synthesize listData;

- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"Sleep", @"Sneezy",
						  @"Bashful", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin",
						  @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili",
						  @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur", nil];
	self.listData = array;
	[array release];
	[super viewDidLoad];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
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
	self.listData = nil;
}


- (void)dealloc {
	[listData release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {

	return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString	*SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 //initWithStyle:UITableViewCellStyleSubtitle
				 reuseIdentifier:SimpleTableIdentifier] autorelease];
	}
	
	UIImage *image = [UIImage imageNamed:@"star.png"];
	cell.imageView.image = image;
	
	NSUInteger row = [indexPath row];
	cell.textLabel.text = [listData objectAtIndex:row];
	cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
	
	if (row < 7) {
		cell.detailTextLabel.text = @"Mr. Disney";
	}
	else {
		cell.detailTextLabel.text = @"Mr. Tolkein";
	}

	
	return cell;		
}

#pragma mark -
#pragma mark Table Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView 
indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	return row;	
}

- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSUInteger row = [indexPath row];
	
	if (row == 0) {
		return nil;
	}
	
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSUInteger row = [indexPath row];
	NSString *rowValue = [listData objectAtIndex:row];
	
	NSString *message = [[NSString alloc] initWithFormat:
						 @"You selected %@", rowValue];
	
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"Row Selected" 
						  message:message 
						  delegate:nil 
						  cancelButtonTitle:@"Yes I Did" 
						  otherButtonTitles:nil];
	
	[alert show];
	[message release];
	[alert release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 70;
}

	

@end
