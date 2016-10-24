//
//  NavigationViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "MainTableViewController.h"
@interface NavigationViewController : UINavigationController
@property  (strong, nonatomic) Person *world;
@end
