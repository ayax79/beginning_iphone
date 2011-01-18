//
//  PresidentsViewController.h
//  Nav
//
//  Created by Andrew Wright on 1/16/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondLevelController.h"

@interface PresidentsViewController : SecondLevelController {
	NSMutableArray *list;
}
@property (nonatomic, retain) NSMutableArray *list;

@end
