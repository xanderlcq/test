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
@interface PersonDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    Person *currentPerson;
}

@property (weak, nonatomic) IBOutlet UINavigationItem *navi;
@property (weak, nonatomic) IBOutlet UITableView *friendsTable;
@property (weak, nonatomic) IBOutlet UITableView *postsTable;


@property Person *world;
@property NSIndexPath *selectedIndex;
@end
