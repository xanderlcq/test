//
//  EditDetailsViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "EditDetailsViewController.h"

@interface EditDetailsViewController ()

@end

@implementation EditDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    currentPerson = [self.world getFriendAt:(int)self.selectedIndex.row];
    self.nameOutlet.text = currentPerson.name;
}

-(Person *)originalPerson{
    if(!_originalPerson){
        _originalPerson = [[Person alloc] initWithName:[NSString stringWithFormat:@"%@",[self.world getFriendAt:(int)self.selectedIndex.row].name]];
        for(int i = 0; i < [currentPerson countFriends];i++){
            [_originalPerson addFriend:[currentPerson getFriendAt:i]];
        }
    }
    return _originalPerson;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [currentPerson countFriends];
    //return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [currentPerson getFriendAt:(int)indexPath.row].name;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [currentPerson removeFriendAt:(int)indexPath.row];
        [currentPerson cleanUpFriendList];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"editToDetailDone"]){
        NSLog(@"editToDetailDone");
        PersonDetailViewController *controller = [segue destinationViewController];
        currentPerson.name =self.nameOutlet.text;
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
    }
    if ([[segue identifier] isEqualToString:@"editToDetailCancel"]){
        NSLog(@"editToDetailCancel");
        PersonDetailViewController *controller = [segue destinationViewController];
        [self.world removeFriendAt:(int)self.selectedIndex.row];
        [self.world addFriendAt:self.originalPerson at:(int)self.selectedIndex.row];
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
        
        
    }
    if ([[segue identifier] isEqualToString:@"editToAddFriends"]){
        NSLog(@"editToAddFriends");
        NSLog(@"%@",self.originalPerson.name);
        AddFriendsViewController *controller = [segue destinationViewController];
        currentPerson.name =self.nameOutlet.text;
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
        controller.originalPerson = self.originalPerson;
        
    }

}



@end
