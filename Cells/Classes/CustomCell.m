//
//  CustomCell.m
//  Cells
//
//  Created by Andrew Wright on 1/10/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell
@synthesize nameLabel;
@synthesize colorLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
	[nameLabel release];
	[colorLabel release];
    [super dealloc];
}


@end
