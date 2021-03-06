//
//  SwapViewController.m
//  Swap
//
//  Created by Andrew Wright on 1/4/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "SwapViewController.h"

@implementation SwapViewController

@synthesize portrait;
@synthesize landscape;
@synthesize landscapeFooButton;
@synthesize portraitFooButton;
@synthesize landscapeBarButton;
@synthesize portraitBarButton;

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
	interfaceOrientation duration:(NSTimeInterval)duration {
	
	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
		self.view = self.portrait;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
		self.view.bounds = CGRectMake(0.0, 0.0, 300.0, 480.0);			
	}
	else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		self.view = self.landscape;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(-90));
		self.view.bounds = CGRectMake(0.0, 0.0, 460.0, 320.0);															
	}
	else if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		self.view = self.portrait;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
		self.view.bounds = CGRectMake(0.0, 0.0, 300.0, 480.0);
	}
	else if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.view = self.landscape;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(90));
		self.view.bounds = CGRectMake(0.0, 0.0, 460.0, 320.0);
	}	
}

- (IBAction)buttonPressed:(id)sender {
	if (sender == portraitFooButton || sender == landscapeFooButton) {			
		portraitFooButton.hidden = YES;
		landscapeFooButton.hidden = YES;
	}
	else {
		portraitBarButton.hidden = YES;
		landscapeBarButton.hidden = YES;
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;	
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
	self.landscape = nil;
	self.portrait = nil;
	self.landscapeFooButton = nil;
	self.landscapeBarButton = nil;
	self.portraitFooButton = nil;
	self.portraitBarButton = nil;
	[super viewDidUnload];
}


- (void)dealloc {
	[landscape release];
	[portrait release];
	[landscapeFooButton release];
	[portraitFooButton release];
	[landscapeBarButton release];
	[landscapeFooButton release];		
    [super dealloc];
}

@end
