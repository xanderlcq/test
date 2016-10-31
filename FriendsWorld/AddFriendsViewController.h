//
//  AddFriendsViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "EditDetailsViewController.h"
@interface AddFriendsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    //Friends list of people who aren't friends with this person, and excluding this person itself.
    Person *notFriendedFriends;
    Person *currentPerson;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property Person *world;
@property NSIndexPath *selectedIndex;
@property Person *originalPerson;
@property (weak, nonatomic) IBOutlet UILabel *nameOutlet;

@end
