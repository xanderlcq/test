//
//  PersonDetailViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "MainTableViewController.h"
#import "EditDetailsViewController.h"
@interface PersonDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameOutlet;

@property Person *world;
@property NSIndexPath *selectedIndex;
@end
