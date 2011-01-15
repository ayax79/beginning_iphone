//
//  DisclosureButtonController.h
//  Nav
//
//  Created by Andrew Wright on 1/14/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelController.h"
@class DisclosureDetailController;

@interface DisclosureButtonController : SecondLevelController {
	NSArray *list;
	DisclosureDetailController *childController;
}
@property(nonatomic, retain) NSArray *list;
@end
