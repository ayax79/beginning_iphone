//
//  SectionsAppDelegate.h
//  Sections
//
//  Created by Andrew Wright on 1/10/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SectionsViewController;

@interface SectionsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SectionsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SectionsViewController *viewController;

@end

