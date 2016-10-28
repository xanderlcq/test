//
//  NavigationViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "NavigationViewController.h"

//THIS IS THE ENTRY POINT OF THE APP
@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainTableViewController *dest = (MainTableViewController *)self.topViewController;
    dest.world = self.world;
    
    // Do any additional setup after loading the view.
}

-(Person *)world{
    if(!_world){
        _world = [[Person alloc] initWithName:@"world"];
        [_world addFriend:[[Person alloc] initWithName:@"Xander Li"]];
        [_world addFriend:[[Person alloc] initWithName:@"Mr. Bakker"]];
        [_world addFriend:[[Person alloc] initWithName:@"Sean"]];
        [_world addFriend:[[Person alloc] initWithName:@"John"]];
        [[_world getFriendAt:0] addFriend:[_world getFriendAt:1]];
        [[_world getFriendAt:1] addPost:@"HW on the desk plz?"];
        [[_world getFriendAt:0] addPost:@"Hello from Xander"];
    }
    return _world;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



@end
