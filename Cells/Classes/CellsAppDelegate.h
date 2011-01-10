//
//  CellsAppDelegate.h
//  Cells
//
//  Created by Andrew Wright on 1/9/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellsViewController;

@interface CellsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CellsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CellsViewController *viewController;

@end

