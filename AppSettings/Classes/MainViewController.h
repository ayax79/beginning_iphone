//
//  MainViewController.h
//  AppSettings
//
//  Created by Andrew Wright on 1/17/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "FlipsideViewController.h"
#define kUsernameKey		@"username"
#define kPasswordKey		@"password"
#define kProtocolKey		@"protocol"
#define kWarpDriveKey		@"warp"
#define kWarpFactorKey		@"warpFactor"
#define kFavoriteTeaKey		@"favoriteTea"
#define kFavoriteCandyKey	@"favoriteCandy"
#define kFavoriteGameKey	@"favoriteGame"
#define kFavoriteExecuseKey	@"favoriteExcuse"
#define	kFavoriteSinKey		@"favoriteSin"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	UILabel *usernameLabel;
	UILabel *passwordLabel;
	UILabel *protocolLabel;
	UILabel *warpDriveLabel;
	UILabel *warpFactorLabel;
	
	UILabel *favoriteTeaLabel;
	UILabel *favoriteCandyLabel;
	UILabel *favoriteGameLabel;
	UILabel *favoriteExecuseLabel;
	UILabel *favoriteSinLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *usernameLabel;
@property (nonatomic, retain) IBOutlet UILabel *passwordLabel;
@property (nonatomic, retain) IBOutlet UILabel *protocolLabel;
@property (nonatomic, retain) IBOutlet UILabel *warpDriveLabel;
@property (nonatomic, retain) IBOutlet UILabel *warpFactorLabel;

@property (nonatomic, retain) IBOutlet UILabel *favoriteTeaLabel;
@property (nonatomic, retain) IBOutlet UILabel *favoriteCandyLabel;
@property (nonatomic, retain) IBOutlet UILabel *favoriteGameLabel;
@property (nonatomic, retain) IBOutlet UILabel *favoriteExecuseLabel;
@property (nonatomic, retain) IBOutlet UILabel *favoriteSinLabel;

- (void)refreshFields;
- (IBAction)showInfo:(id)sender;

@end
