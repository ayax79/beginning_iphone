//
//  Simple_TableViewController.h
//  Simple Table
//
//  Created by Andrew Wright on 1/8/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Simple_TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray *listData;
}
@property(nonatomic, retain) NSArray *listData;

@end

