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
    self.nameOutlet.text = [self.world getFriendAt:(int)self.selectedIndex.row].name;
}

-(Person *)originalPerson{
    if(!_originalPerson){
        _originalPerson = [[Person alloc] initWithName:[NSString stringWithFormat:@"%@",[self.world getFriendAt:(int)self.selectedIndex.row].name]];
        for(int i = 0; i < [[self.world getFriendAt:(int)self.selectedIndex.row] countFriends];i++){
            [_originalPerson addFriend:[[self.world getFriendAt:(int)self.selectedIndex.row] getFriendAt:i]];
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
    return [[self.world getFriendAt:(int)self.selectedIndex.row] countFriends];
    //return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.world getFriendAt:(int)self.selectedIndex.row] getFriendAt:(int)indexPath.row].name;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[self.world getFriendAt:(int)self.selectedIndex.row] removeFriendAt:(int)indexPath.row];
        [[self.world getFriendAt:(int)self.selectedIndex.row] cleanUpFriendList];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"editToDetailDone"]){
        NSLog(@"editToDetailDone");
        PersonDetailViewController *controller = [segue destinationViewController];
        [self.world getFriendAt:(int)self.selectedIndex.row].name =self.nameOutlet.text;
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
                [self.world getFriendAt:(int)self.selectedIndex.row].name =self.nameOutlet.text;
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
        controller.originalPerson = self.originalPerson;
        
    }

}



@end
