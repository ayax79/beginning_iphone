//
//  MainViewController.m
//  AppSettings
//
//  Created by Andrew Wright on 1/17/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController
@synthesize usernameLabel;
@synthesize passwordLabel;
@synthesize protocolLabel;
@synthesize warpDriveLabel;
@synthesize warpFactorLabel;
@synthesize favoriteTeaLabel;
@synthesize favoriteCandyLabel;
@synthesize favoriteGameLabel;
@synthesize favoriteExecuseLabel;
@synthesize favoriteSinLabel;


- (void)refreshFields {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	usernameLabel.text = [defaults objectForKey:kUsernameKey];
	passwordLabel.text = [defaults objectForKey:kPasswordKey];
	protocolLabel.text = [defaults objectForKey:kProtocolKey];
	warpDriveLabel.text = [defaults objectForKey:kWarpDriveKey];
	warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey] stringValue];
	favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
	favoriteCandyLabel.text = [defaults objectForKey:kFavoriteCandyKey];
	favoriteGameLabel.text = [defaults objectForKey:kFavoriteGameKey];
	favoriteExecuseLabel.text = [defaults objectForKey:kFavoriteExecuseKey];
	favoriteSinLabel.text = [defaults objectForKey:kFavoriteSinKey];
}
-(void)viewDidAppear:(BOOL)animated {
	[self refreshFields];
	[super viewDidAppear:animated];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}
*/


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
	[self refreshFields];    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.usernameLabel = nil;
	self.passwordLabel = nil;
	self.protocolLabel = nil;
	self.warpFactorLabel = nil;
	self.warpDriveLabel = nil;
	self.favoriteTeaLabel = nil;
	self.favoriteCandyLabel = nil;
	self.favoriteGameLabel = nil;
	self.favoriteExecuseLabel = nil;
	self.favoriteSinLabel = nil;
	[super viewDidUnload];	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)dealloc {
	[usernameLabel release];
	[passwordLabel release];
	[protocolLabel release];
	[warpDriveLabel release];
	[warpFactorLabel release];
	[favoriteTeaLabel release];
	[favoriteCandyLabel release];
	[favoriteGameLabel release];
	[favoriteExecuseLabel release];
	[favoriteSinLabel release];
    [super dealloc];
}


@end
