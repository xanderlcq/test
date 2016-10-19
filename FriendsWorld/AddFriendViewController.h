//
//  AddFriendViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinkedList.h"
#import "Person.h"
#import "NavigationViewController.h"
#import "MainTableViewController.h"
@interface AddFriendViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameOutlet;
@property Person *world;
@property NSString *test;
@end
