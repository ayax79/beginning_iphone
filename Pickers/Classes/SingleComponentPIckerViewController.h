//
//  SingleComponentPIckerViewController.h
//  Pickers
//
//  Created by Andrew Wright on 1/5/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SingleComponentPIckerViewController : UIViewController 
	<UIPickerViewDelegate, UIPickerViewDataSource> {
		UIPickerView *singlePicker;
		NSArray *pickerData;
}
@property (nonatomic, retain) IBOutlet UIPickerView *singlePicker;
@property (nonatomic, retain) IBOutlet NSArray *pickerData;
- (IBAction)buttonPrseed;
@end
