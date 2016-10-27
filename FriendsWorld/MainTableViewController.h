//
//  MainTableViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersonDetailViewController.h"
#import "AddPersonViewController.h"
#import "SearchResultsViewController.h"
@interface MainTableViewController : UITableViewController <UISearchResultsUpdating, UISearchControllerDelegate>
@property Person *world;
- (IBAction)searchButton:(id)sender;
@property (strong, nonatomic) UISearchController *controller;
@property (strong, nonatomic) NSArray *results;
@property NSArray *namesArrayForSearching;
@end
