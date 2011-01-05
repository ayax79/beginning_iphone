//
//  Button_FunViewController.h
//  Button Fun
//
//  Created by Andrew Wright on 1/2/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Button_FunViewController : UIViewController {
	UILabel *statusText;

}
@property (nonatomic, retain) IBOutlet UILabel *statusText;
- (IBAction)buttonPressed:(id)sender;

@end

