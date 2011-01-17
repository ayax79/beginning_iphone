//
//  MoveMeController.h
//  Nav
//
//  Created by Andrew Wright on 1/16/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelController.h"

@interface MoveMeController : SecondLevelController {
	NSMutableArray *list;
}
@property (nonatomic, retain) NSMutableArray *list;
- (IBAction)toggleMove;
@end
