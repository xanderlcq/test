//
//  WritePostViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/27/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "WritePostViewController.h"

@interface WritePostViewController ()

@end

@implementation WritePostViewController

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
    if(tableView == self.postsTable){
        NSLog(@"%d",[currentPerson countPosts]);
        return [currentPerson countPosts];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(tableView == self.postsTable){
        cell.textLabel.text = [currentPerson getPostAt:(int)indexPath.row];
    }
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"writePostToDetail"]){
        NSLog(@"writePostToDetail");
        PersonDetailViewController *controller = [segue destinationViewController];
        controller.world = self.world;
        controller.selectedIndex = self.selectedIndex;
    }

}
//Stack overflow
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [currentPerson removePostAt:(int)indexPath.row];
        [self.postsTable deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)postButton:(id)sender {
    if(![self.textInputOutlet.text  isEqual: @""]){
        [currentPerson addPost:self.textInputOutlet.text];
        self.textInputOutlet.text = @"";
        [self.postsTable reloadData];
    }
}
@end
