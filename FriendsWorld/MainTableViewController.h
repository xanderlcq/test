//
//  MainTableViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddFriendViewController.h"
#import "Person.h"
@interface MainTableViewController : UITableViewController
@property Person *world;
@property (weak, nonatomic) IBOutlet UINavigationItem *navi;
@property NSString *test;

@end
