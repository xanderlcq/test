//
//  AddPersonViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "NavigationViewController.h"
@interface AddPersonViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property Person *world;
@property (weak, nonatomic) IBOutlet UITextField *nameOutlet;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
