//
//  DoubleComponentPickerViewController.h
//  Pickers
//
//  Created by Andrew Wright on 1/5/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {		
	UIPickerView *doublePicker;
	NSArray *fillingTypes;
	NSArray *breadTypes;					
}
@property (nonatomic, retain) IBOutlet UIPickerView *doublePicker;
@property (nonatomic, retain) NSArray *fillingTypes;
@property (nonatomic, retain) NSArray *breadTypes;
- (IBAction)buttonPressed;
@end
