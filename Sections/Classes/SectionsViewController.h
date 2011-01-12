//
//  SectionsViewController.h
//  Sections
//
//  Created by Andrew Wright on 1/10/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	NSDictionary *names;
	NSArray *keys;
}
@property(nonatomic, retain) NSDictionary *names;
@property(nonatomic, retain) NSArray *keys;

@end

