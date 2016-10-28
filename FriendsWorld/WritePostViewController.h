//
//  WritePostViewController.h
//  FriendsWorld
//
//  Created by Xander on 10/27/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Post.h"
#import "PersonDetailViewController.h"
@interface WritePostViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    Person *currentPerson;
}

@property (weak, nonatomic) IBOutlet UINavigationItem *navi;
@property (weak, nonatomic) IBOutlet UITableView *postsTable;
@property (weak, nonatomic) IBOutlet UITextView *textInputOutlet;
- (IBAction)postButton:(id)sender;


@property Person *world;
@property NSIndexPath *selectedIndex;
@end
