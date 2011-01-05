    //
//  SwitchViewController.m
//  View Switcher
//
//  Created by Andrew Wright on 1/4/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "SwitchViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"


@implementation SwitchViewController
@synthesize yellowViewController;
@synthesize blueViewController;


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	BlueViewController *blueController = [[BlueViewController alloc]
										  initWithNibName:@"BlueView" bundle:nil];
	self.blueViewController = blueController;
	[self.view insertSubview:blueController.view atIndex:0];
	[blueController release];
	[super viewDidLoad];
}

- (IBAction)switchView:(id)sender {
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1.25];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	if (self.yellowViewController.view.subviews == nil) {
		if (self.yellowViewController == nil) {
			YellowViewController *yellowController = 
				[[YellowViewController alloc] initWithNibName:@"YellowView" 
													   bundle:nil];
			self.yellowViewController = yellowController;
			[yellowController release];			
		}
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight 
							   forView:self.view cache:YES];
		
		
		[self.blueViewController.view removeFromSuperview];
		[self.view insertSubview:yellowViewController.view atIndex:0];
	}
	else {
		if (self.blueViewController == nil) {
			BlueViewController *blueController = blueController;
			[blueController release];
		}
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft 
							   forView:self.view cache:YES];
		
		
		[self.yellowViewController.view removeFromSuperview];
		[self.view insertSubview:blueViewController.view atIndex:0];
	}
	[UIView commitAnimations];
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


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
	if (self.blueViewController.view.superview == nil) {
		self.blueViewController = nil;
	}
	else {
		self.yellowViewController = nil;
	}
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[yellowViewController release];
	[blueViewController release];
    [super dealloc];
}


@end
