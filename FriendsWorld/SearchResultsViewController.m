
//
//  SearchResultsViewController.m
//  FriendsWorld
//
//  Created by Xander on 10/26/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "SearchResultsViewController.h"

@interface SearchResultsViewController ()
@property (nonatomic, strong) NSArray *searchResults;
@end

@implementation SearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    
    cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"%ld",(long)[self.tableView indexPathForSelectedRow].row);
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    // extract array from observer
    self.searchResults = [(NSArray *)object valueForKey:@"results"];
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"searchToDetail"]){
        NSLog(@"searchToDetail");
        int ogIndex = (int)[self.world indexOfName:[self.searchResults objectAtIndex:[self.tableView indexPathForSelectedRow].row]];
        NSIndexPath *ogIndexPath = [NSIndexPath indexPathForRow:ogIndex inSection:0];
        PersonDetailViewController *detailController = [segue destinationViewController];
        detailController.world = self.world;
        detailController.selectedIndex = ogIndexPath;
    }
    
}

@end
