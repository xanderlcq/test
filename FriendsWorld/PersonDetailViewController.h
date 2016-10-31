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
#import "WritePostViewController.h"
#import "Post.h"
@interface PersonDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    Person *currentPerson;
}

@property (weak, nonatomic) IBOutlet UINavigationItem *navi;
//Table view that displays friends of this person
@property (weak, nonatomic) IBOutlet UITableView *friendsTable;

//Table view that displays the posts by this person's friends
@property (weak, nonatomic) IBOutlet UITableView *postsTable;

@property Person *world;
@property NSIndexPath *selectedIndex;
@end
