//
//  AddPersonViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/19/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController ()

@end

@implementation AddPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelection = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"addPersonToMainCancel"]){
        NSLog(@"seg triggered");
        NavigationViewController *controller = [segue destinationViewController];
        controller.world = self.world;
    }
    if ([[segue identifier] isEqualToString:@"addPersonToMainDone"]){
        NSLog(@"seg triggered");
        NavigationViewController *controller = [segue destinationViewController];
        
        NSArray *selectedCells = [self.tableView indexPathsForSelectedRows];
        
        NSLog(@"%lu",(unsigned long)[selectedCells count]);
        Person *temp =[[Person alloc] initWithName:self.nameOutlet.text];
        for(int i = 0; i < [selectedCells count];i++){
            NSIndexPath *tempIndexPath =(NSIndexPath *)[selectedCells objectAtIndex:i];
            [temp addFriend:[self.world getFriendAt:(int)tempIndexPath.row]];
        }
        [self.world addFriend:temp];
        controller.world = self.world;
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.world countFriends];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    }else{
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.world getFriendAt:(int)indexPath.row].name;
    return cell;
}

@end
