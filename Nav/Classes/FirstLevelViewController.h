//
//  FirstLevelViewController.h
//  Nav
//
//  Created by Andrew Wright on 1/14/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstLevelViewController : UITableViewController {
	NSArray *controllers;
}
@property(nonatomic, retain) NSArray *controllers;

@end
