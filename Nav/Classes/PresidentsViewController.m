//
//  PresidentsViewController.m
//  Nav
//
//  Created by Eric Hayes on 5/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PresidentsViewController.h"
#import "PresidentDetailController.h"
#import "President.h"
#import "NavAppDelegate.h"

@implementation PresidentsViewController
@synthesize list;

- (id)initWithStyle:(UITableViewStyle)style {
	if ( self = [super initWithStyle:style] ) {
		
	}
	return self;
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Presidents" ofType:@"plist"];
	
	NSData *data;
	NSKeyedUnarchiver *unarchiver;
	
	data = [[NSData alloc] initWithContentsOfFile:path];
	unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
	
	NSMutableArray *array = [unarchiver decodeObjectForKey:@"Presidents"];
	self.list = array;
	[unarchiver finishDecoding];
	[unarchiver release];
	[data release];
	
	[super viewDidLoad];
}


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
    [list release];
	[super dealloc];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString * ident = @"PresListIdent";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
	if ( cell == nil ) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:ident] autorelease];
	}
	NSUInteger row = [indexPath row];
	President *thePres = [self.list objectAtIndex:row];
	cell.textLabel.text = thePres.name;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	President *thePres = [self.list objectAtIndex:row];
	
	PresidentDetailController *childController = [[PresidentDetailController alloc] initWithStyle:UITableViewStyleGrouped];
	
	childController.title = thePres.name;
	childController.president = thePres;
	
	NavAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	UINavigationController *nav = [delegate navController];
	[nav pushViewController:childController animated:YES];
	[childController release];
}


@end
