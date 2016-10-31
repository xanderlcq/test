//
//  MainTableViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/18/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cleanUpAllFriends];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    
    
    self.namesArrayForSearching = [self.world friendsToArray];
    
    SearchResultsViewController *searchResults = (SearchResultsViewController *)self.controller.searchResultsController;
    searchResults.world = self.world;
    [self addObserver:searchResults forKeyPath:@"results" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//default initializer of object controller
- (UISearchController *)controller {
    
    if (!_controller) {
        
        // create search results table view
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SearchResultsViewController *resultsController = [storyboard instantiateViewControllerWithIdentifier:@"SearchResults"];
        
        // create search controller with the table view just created
        _controller = [[UISearchController alloc]initWithSearchResultsController:resultsController];
        _controller.searchResultsUpdater = self;
        
        // set the search controller delegate
        _controller.delegate = self;
        
    }
    return _controller;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"mainToDetail"]){
        NSLog(@"mainToDetail");
        PersonDetailViewController *controller = [segue destinationViewController];
        controller.world = self.world;
        controller.selectedIndex = [self.tableView indexPathForSelectedRow];
    }
    if ([[segue identifier] isEqualToString:@"mainToAddPerson"]){
        NSLog(@"mainToAddPerson");
        AddPersonViewController *controller = [segue destinationViewController];
        controller.world = self.world;
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.world countFriends];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.world getFriendAt:(int)indexPath.row].name;
    return cell;
}

//Stack overflow, Deleting function
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.world getFriendAt:(int)indexPath.row].isDeleted = YES;
        
        [self cleanUpAllFriends];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        self.namesArrayForSearching = [self.world friendsToArray];
}

-(void) cleanUpAllFriends{
    [self.world cleanUpFriendList];
    for(int i = 0; i < [self.world countFriends];i++){
        [[self.world getFriendAt:i] cleanUpFriendList];
    }
}


# pragma mark - Search Results Updater

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    // filter search result from a NSArray of names (NSString *)
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains [cd] %@", self.controller.searchBar.text];
    self.results = [self.namesArrayForSearching filteredArrayUsingPredicate:predicate];

}

- (IBAction)searchButton:(id)sender {
    //Present search view
    [self presentViewController:self.controller animated:YES completion:nil];
}


@end
