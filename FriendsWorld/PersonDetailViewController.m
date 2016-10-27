//
//  PersonDetailViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "PersonDetailViewController.h"

@interface PersonDetailViewController ()

@end

@implementation PersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentPerson = [self.world getFriendAt:(int)self.selectedIndex.row];
    self.navi.title =currentPerson.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.friendsTable){
        return [currentPerson countFriends];
    }
    if(tableView == self.postsTable){
        NSLog(@"%d",[currentPerson countFriendPosts]);
        return [currentPerson countFriendPosts];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(tableView == self.friendsTable){
        cell.textLabel.text = [currentPerson getFriendAt:indexPath.row].name;
    }
    if(tableView == self.postsTable){
        cell.textLabel.text = [currentPerson getFriendPostAt:indexPath.row];
        //cell.textLabel.text = @"abc";
    }
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailToMain"]){
        NSLog(@"detailToMain");
        MainTableViewController *controller = [segue destinationViewController];
        controller.world = self.world;

    }
    if ([[segue identifier] isEqualToString:@"detailToEdit"]){
        NSLog(@"detailToEdit");
        EditDetailsViewController *controller = [segue destinationViewController];
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
        
    }
    if ([[segue identifier] isEqualToString:@"editToAddFriends"]){
        NSLog(@"editToAddFriends");
        EditDetailsViewController *controller = [segue destinationViewController];
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
        
    }
}

@end
