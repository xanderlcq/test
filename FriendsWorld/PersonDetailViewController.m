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
    
    self.nameOutlet.text = [self.world getFriendAt:self.selectedIndex.row].name;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.world getFriendAt:self.selectedIndex.row] countFriends];
    //return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.world getFriendAt:self.selectedIndex.row] getFriendAt:indexPath.row].name;
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
//


@end
