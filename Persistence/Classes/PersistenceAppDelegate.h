//
//  PersistenceAppDelegate.h
//  Persistence
//
//  Created by Andrew Wright on 1/18/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersistenceViewController;

@interface PersistenceAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PersistenceViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PersistenceViewController *viewController;

@end

