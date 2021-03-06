//
//  SectionsViewController.m
//  Sections
//
//  Created by Andrew Wright on 1/10/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "SectionsViewController.h"
#import "NSDictionary-MutableDeepCopy.h"

@implementation SectionsViewController
@synthesize names;
@synthesize keys;
@synthesize table;
@synthesize search;
@synthesize allNames;

#pragma mark -
#pragma mark Custom Methods
- (void)resetSearch {
	NSMutableDictionary *allNamesCopy = [self.allNames mutableDeepCopy];
	self.names = allNamesCopy;
	[allNamesCopy release];
	NSMutableArray *keyArray = [[NSMutableArray alloc] init];
	[keyArray addObject:UITableViewIndexSearch];
	[keyArray addObjectsFromArray:[[self.allNames allKeys] 
								   sortedArrayUsingSelector:@selector(compare:)]];
	self.keys = keyArray;
	[keyArray release];	 	
}

- (void)handleSearchForTerm:(NSString *)searchTerm {
	NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
	[self resetSearch];
	
	for (NSString *key in self.keys) {
		NSMutableArray *array = [names valueForKey:key];
		NSMutableArray *toRemove = [[NSMutableArray alloc] init];
		for (NSString *name in array) {
			if ([name rangeOfString:searchTerm
							options:NSCaseInsensitiveSearch].location == NSNotFound) {
				[toRemove addObject:name];
			}
		}
		
		if ([array count] == [toRemove count]) {
			[sectionsToRemove addObject:key];
		}
		
		[array removeObjectsInArray:toRemove];
		[toRemove release];
	}
	[self.keys removeObjectsInArray:sectionsToRemove];
	[sectionsToRemove release];
	[table reloadData];
}

- (void)viewDidLoad {

	NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
	self.allNames = dict;
	[dict release];
	
	[self resetSearch];
	[table reloadData];
	[table setContentOffset:CGPointMake(0.0, 44.0) animated:NO];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.table = nil;
	self.search = nil;
	self.allNames = nil;
	self.names = nil;
	self.keys = nil;
}


- (void)dealloc {
	[table release];
	[search release];
	[allNames release];
	[names release];
	[keys release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return ([keys count] > 0) ? [keys count] : 1;
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
	if ([keys count] == 0)
		return 0;

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
	
	if ([keys count] == 0)
		return nil;

	NSString *key = [keys objectAtIndex:section];
	if (key == UITableViewIndexSearch)
		return nil;	
	
	return key;	
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	if (isSearching)
		return nil;
	
	return keys;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (NSIndexPath *)tableView:(UITableView *)tableView 
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	isSearching = NO;
	[search resignFirstResponder];
	return indexPath;
}

#pragma mark -
#pragma mark Search Bar Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
		
	NSString *searchTerm = [searchBar text];
	[self handleSearchForTerm:searchTerm];
}

- (void)searchBar:(UISearchBar *)searchBar 
	textDidChange:(NSString *)searchText {
	
	if ([searchText length] == 0) {
		[self resetSearch];
		[table reloadData];
		return;
	}
	[self handleSearchForTerm:searchText];
	
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	isSearching = NO;
	search.text = @"";
	[self resetSearch];
	[table reloadData];
	[searchBar resignFirstResponder];	
	// i added this, hides search on cancel
	[table setContentOffset:CGPointMake(0.0, 44.0) animated:YES];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
	isSearching = YES;
	[table reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView 
sectionForSectionIndexTitle:(NSString *)title 
		  atIndex:(NSInteger)index {
	NSString *key = [keys objectAtIndex:index];
	if (key == UITableViewIndexSearch) {
		[tableView setContentOffset:CGPointZero animated:NO];
		return NSNotFound;
	}
	else return index;
	
}

@end
