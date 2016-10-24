//
//  AddFriendsViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "AddFriendsViewController.h"

@implementation AddFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelection = YES;
    self.nameOutlet.text = [self.world getFriendAt:self.selectedIndex.row].name;
    notFriendedFriends = [[Person alloc] initWithName:@"notFrindedFriends"];
    
    
    for (int i = 0; i < [self.world countFriends]; i++) {
        if(i != self.selectedIndex.row && ![[self.world getFriendAt:self.selectedIndex.row] isFriended:[self.world getFriendAt:i]]){
            NSLog(@"isn't friended: %@",[self.world getFriendAt:i].name);
            [notFriendedFriends addFriend:[self.world getFriendAt:i]];
        }else{
            NSLog(@"friended: %@",[self.world getFriendAt:i].name);
        }
    }
    
    //NSLog(@"%i",[notFriendedFriends countFriends]);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning TODO
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning TODO
    return [notFriendedFriends countFriends];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
cell.textLabel.text = [notFriendedFriends getFriendAt:indexPath.row].name;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"addFriendsToDetailDone"]){
        NSLog(@"seg triggered");
        EditDetailsViewController *controller = [segue destinationViewController];
        NSArray *selectedCells = [self.tableView indexPathsForSelectedRows];
        
        NSLog(@"%lu",(unsigned long)[selectedCells count]);
        for(int i = 0; i < [selectedCells count];i++){
            NSIndexPath *tempIndexPath =(NSIndexPath *)[selectedCells objectAtIndex:i];
            int row = (int)tempIndexPath.row;
            [[self.world getFriendAt:self.selectedIndex.row] addFriend:[notFriendedFriends getFriendAt:row]];
        }

        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
        controller.originalPerson = self.originalPerson;
    }
    if ([[segue identifier] isEqualToString:@"addFriendsToDetailCancel"]){
        NSLog(@"seg triggered");
        EditDetailsViewController *controller = [segue destinationViewController];
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
        controller.originalPerson = self.originalPerson;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    }else{
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

@end
