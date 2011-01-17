//
//  CheckListController.h
//  Nav
//
//  Created by Andrew Wright on 1/15/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelController.h"


@interface CheckListController : SecondLevelController {
	NSArray *list;
	NSIndexPath *lastIndexPath;
}
@property(nonatomic, retain) NSArray *list;
@property(nonatomic, retain) NSIndexPath *lastIndexPath;
@end
