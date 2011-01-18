//
//  PresidentDetailController.h
//  Nav
//
//  Created by Eric Hayes on 5/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#define kNumFields		4
#define kNameField		0
#define kFromField		1
#define kToField		2
#define kPartyField		3

#define kLabelTag		4096

#import <UIKit/UIKit.h>
@class President;

@interface PresidentDetailController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
	President *president;
	NSArray *fieldLabels;
	NSMutableDictionary *tempValues;
	UITextField *textFieldBeingEdited;
}
@property (nonatomic, retain) President *president;
@property (nonatomic, retain) NSArray *fieldLabels;
@property (nonatomic, retain) NSMutableDictionary *tempValues;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)textFieldDone:(id)sender;

@end
