//
//  FlipsideViewController.h
//  AppSettings
//
//  Created by Andrew Wright on 1/17/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	UISwitch *engineSwitch;
	UISlider *warpFactorSlider;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, assign) IBOutlet UISwitch *engineSwitch;
@property (nonatomic, assign) IBOutlet UISlider *warpFactorSlider;
- (IBAction)done:(id)sender;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

