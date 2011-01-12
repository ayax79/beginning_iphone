//
//  SectionsViewController.m
//  Sections
//
//  Created by Andrew Wright on 1/10/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "SectionsViewController.h"

@implementation SectionsViewController
@synthesize names;
@synthesize keys;

- (void)viewDidLoad {

	NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
	self.names = dict;
	[dict release];
	NSArray *array = [[names allKeys] sortedArrayUsingSelector:@selector(compare:)];
	self.keys = array;
}



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
	self.names = nil;
	self.keys = nil;
}


- (void)dealloc {
	[names release];
	[keys release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {

	NSString *key = [keys objectAtIndex:section];
	NSArray *namesSection = [names objectForKey:key];
	return [namesSection count];	
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSUInteger section = [indexPath section];
	NSUInteger row = [indexPath row];
	
	NSString *key = [keys objectAtIndex:section];
	NSArray *nameSection = [names objectForKey:key];
	
	static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:SectionsTableIdentifier] autorelease];
	}
	
	cell.textLabel.text = [nameSection objectAtIndex:row];
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView 
titleForHeaderInSection:(NSInteger)section {

	NSString *key = [keys objectAtIndex:section];
	return key;	
}


@end
