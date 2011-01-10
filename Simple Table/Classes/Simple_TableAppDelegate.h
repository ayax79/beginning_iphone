//
//  Simple_TableAppDelegate.h
//  Simple Table
//
//  Created by Andrew Wright on 1/8/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Simple_TableViewController;

@interface Simple_TableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Simple_TableViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Simple_TableViewController *viewController;

@end

