//
//  NavigationViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainTableViewController *dest = (MainTableViewController *)self.topViewController;
    dest.test = self.test;
    dest.world = self.world;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



@end
