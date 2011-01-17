//
//  CheckListController.m
//  Nav
//
//  Created by Andrew Wright on 1/15/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "CheckListController.h"


@implementation CheckListController
@synthesize list;
@synthesize lastIndexPath;

- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"Who Hash",
					@"Bubba Gump Shrimp Etouffe", @"Who Pudding", @"Scooby Snacks",
					@"Everlasting Gobstopper", @"Green Eggs and Ham", @"Soylent Green",
					@"Hard Tack", @"Lembas Bread", @"Roast Beast", @"Blacmange", nil];
	
	self.list = array;
	[array release];
	[super viewDidLoad];	
}
- (void)viewDidUnload {
	self.list = nil;
	self.lastIndexPath = nil;
	[super viewDidUnload];
}
#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
	
	return [list count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CheckMarkCellIdentifier = @"CheckMarkCellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CheckMarkCellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CheckMarkCellIdentifier] autorelease];
	}
	NSUInteger row = [indexPath row];
	NSUInteger oldRow = [lastIndexPath row];
	cell.textLabel.text = [list objectAtIndex:row];
	cell.accessoryType = (row == oldRow && lastIndexPath != nil) ?
	UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	return cell;
}
#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	int newRow = [indexPath row];
	int oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
	
	if (newRow != oldRow) {
		UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
		newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:lastIndexPath];
		oldCell.accessoryType = UITableViewCellAccessoryNone;
		lastIndexPath = indexPath;
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];		
}

@end
