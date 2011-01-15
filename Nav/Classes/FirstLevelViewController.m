//
//  FirstLevelViewController.m
//  Nav
//
//  Created by Andrew Wright on 1/14/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "FirstLevelViewController.h"
#import "SecondLevelController.h"
#import "DisclosureButtonController.h"


@implementation FirstLevelViewController
@synthesize controllers;

- (void)viewDidLoad {
	self.title = @"First Level";
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	// Disclosure Button
	DisclosureButtonController *disclosureButtonController = 
		[[DisclosureButtonController alloc]
		 initWithStyle:UITableViewStylePlain];
	disclosureButtonController.title = @"Disclosure Buttons";
	disclosureButtonController.rowImage = [UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
	[array addObject:disclosureButtonController];
	[disclosureButtonController release];
	
	self.controllers = array;
	[array release];
	[super viewDidLoad];
}
- (void)viewDidUnload {
	self.controllers = nil;
	[super viewDidUnload];
}
- (void)dealloc {
	[controllers release];
	[super dealloc];
}
#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.controllers count];
}

	- (UITableViewCell *)tableView:(UITableView *)tableView 
	cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *FirstLevelCell = @"FirstLevelCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstLevelCell];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:FirstLevelCell] autorelease];		
	}
	// Configure the cell
	NSUInteger row = [indexPath row];
	SecondLevelController *controller = [controllers objectAtIndex:row];
	cell.textLabel.text = controller.title;
	cell.imageView.image = controller.rowImage;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;	
}
#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	SecondLevelController *nextController = [self.controllers objectAtIndex:row];
	[self.navigationController pushViewController:nextController animated:YES];
}

@end
