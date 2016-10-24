//
//  EditDetailsViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "AddFriendsViewController.h"
#import "PersonDetailViewController.h"
#import "NavigationViewController.h"
@interface EditDetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property Person *world;
@property NSIndexPath *selectedIndex;
@property Person *originalPerson;
@property (weak, nonatomic) IBOutlet UITextField *nameOutlet;

@end
