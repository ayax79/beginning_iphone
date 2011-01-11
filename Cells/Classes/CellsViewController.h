//
//  CellsViewController.h
//  Cells
//
//  Created by Andrew Wright on 1/9/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTableViewRowHeight 66
@interface CellsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	NSArray *computers;
}
@property (nonatomic, retain) NSArray *computers;
@end