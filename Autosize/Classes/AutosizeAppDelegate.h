//
//  AutosizeAppDelegate.h
//  Autosize
//
//  Created by Andrew Wright on 1/3/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutosizeViewController;

@interface AutosizeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AutosizeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AutosizeViewController *viewController;

@end

