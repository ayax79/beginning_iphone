//
//  RowControlsController.m
//  Nav
//
//  Created by Andrew Wright on 1/16/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "RowControlsController.h"


@implementation RowControlsController
@synthesize list;
- (IBAction)buttonTapped:(id)sender {
	UIButton *senderButton = (UIButton *)sender;
	UITableViewCell *buttonCell = (UITableViewCell *) [senderButton subviews];
	NSUInteger buttonRow = [[self.tableView indexPathForCell:buttonCell] row];
	NSString *buttonTitle = [list objectAtIndex:buttonRow];
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"You tapped the button"
						  message:[NSString stringWithFormat:
							@"You tapped the button for %@", buttonTitle]
						  delegate:nil
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
}
- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"R2-D2",
					  @"C3P0", @"Tik-Tok", @"Robby", @"Rosie", @"Uniblah",
					  @"Bender", @"Marvin", @"Lt. Commander Data",
					  @"Evil Brother Lore", @"Optimus Prime", @"Tobor", @"HAL",
					  @"Orgasmatron", nil];
	self.list = array;
	[array release];
	[super viewDidLoad];
}
- (void)viewDidUnload {
	self.list = nil;
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
	
	static NSString *ControllerRowIdentifier = @"ControllerRowIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ControllerRowIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:ControllerRowIdentifier] autorelease];
		UIImage *buttonUpImage = [UIImage imageNamed:@"button_up.png"];
		UIImage *buttonDownImage = [UIImage imageNamed:@"button_down.png"];
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(0.0, 0.0, buttonUpImage.size.width, buttonUpImage.size.height);
		[button setBackgroundImage:buttonUpImage forState:UIControlStateNormal];
		[button setBackgroundImage:buttonDownImage forState:UIControlStateHighlighted];
		[button setTitle:@"Tap" forState:UIControlStateNormal];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
		cell.accessoryView = button;
	}
	NSUInteger row = [indexPath row];
	NSString *rowTitle = [list objectAtIndex:row];
	cell.textLabel.text = rowTitle;
	return cell;	
}
#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSUInteger row = [indexPath row];
	NSString *rowTitle = [list objectAtIndex:row];
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"You tapped the row."
						  message:[NSString stringWithFormat:@"You tapped %@", rowTitle]
						  delegate:nil 
						  cancelButtonTitle:@"OK" 
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
