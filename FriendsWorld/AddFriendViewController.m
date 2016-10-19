//
//  AddFriendViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "AddFriendViewController.h"

@interface AddFriendViewController ()

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameOutlet.text = self.test;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"seg2"]){
        NavigationViewController *controller = [segue destinationViewController];
        controller.world = self.world;
        controller.test = @"lol";
        NSLog(@"seg triggered");
    
    }
}

@end
