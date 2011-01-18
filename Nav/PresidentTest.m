//
//  PresidentTest.m
//  Nav
//
//  Created by Andrew Wright on 1/17/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import "PresidentTest.h"
#import "President.h"


@implementation PresidentTest

- (void)testPresidentsOutput {
	President *p = [[President alloc] init];
	p.number = 1;
	p.name = @"George Washington";
	p.fromYear = @"February 22, 1732";
	p.toYear = @"December 14, 1799";
	p.party = @"None";

	NSString *archivePath = [NSHomeDirectory() stringByAppendingFormat:@"Map.archive"];
	
	[NSKeyedArchiver archiveRootObject:p toFile:archivePath];
	
	
//	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:p];
//	[archiver encodeObject:p forKey:@"President"];
//	[archiver finishEncoding];
//	[p writeToFile:archivePath atomically:YES];
//	//NSLog([NSString stringWithFormat:@"Result %@", result]);
//	[archiver release];
//	[archivePath release];
//	[p release];			
}


@end
