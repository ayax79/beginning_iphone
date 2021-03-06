//
//  SwapViewController.h
//  Swap
//
//  Created by Andrew Wright on 1/4/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

#define degreesToRadians(x) (M_PI * (x) / 180.0)
@interface SwapViewController : UIViewController {
	UIView *landscape;
	UIView *portrait;
	
	UIButton *landscapeFooButton;
	UIButton *portraitFooButton;
	
	UIButton *landscapeBarButton;
	UIButton *portraitBarButton;
				
}

@property (nonatomic, retain) IBOutlet UIView *landscape;
@property (nonatomic, retain) IBOutlet UIView *portrait;
@property (nonatomic, retain) IBOutlet UIButton *landscapeFooButton;
@property (nonatomic, retain) IBOutlet UIButton *portraitFooButton;
@property (nonatomic, retain) IBOutlet UIButton *landscapeBarButton;
@property (nonatomic, retain) IBOutlet UIButton *portraitBarButton;

-(IBAction)buttonPressed:(id)sender;

@end

