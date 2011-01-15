//
//  DisclosureDetailController.h
//  Nav
//
//  Created by Andrew Wright on 1/14/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DisclosureDetailController : UIViewController {
	UILabel *label;
	NSString *message;
}
@property(nonatomic, retain) IBOutlet UILabel *label;
@property(nonatomic, retain) NSString *message;
@end
