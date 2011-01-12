//
//  SectionsViewController.h
//  Sections
//
//  Created by Andrew Wright on 1/10/11.
//  Copyright 2011 Syncapse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController 
<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate> {
	UITableView *table;
	UISearchBar *search;
	NSDictionary *allNames;
	NSMutableDictionary *names;
	NSMutableArray *keys;
	BOOL isSearching;
}
@property(nonatomic, retain) IBOutlet UITableView *table;
@property(nonatomic, retain) IBOutlet UISearchBar *search;
@property(nonatomic, retain) NSDictionary *allNames;
@property(nonatomic, retain) NSMutableDictionary *names;
@property(nonatomic, retain) NSMutableArray *keys;
- (void)resetSearch;
- (void)handleSearchForTerm:(NSString *)searchTerm;
@end

