//
//  ICM_StartingRoomViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-12.
//  Copyright (c) 2013 ICM. All rights reserved.
//
// Displays the list of rooms based on the building that the user selected

#import "ICM_StartingRoomViewController.h"
#import "ICM_Model.h"

@interface ICM_StartingRoomViewController ()

@end

@implementation ICM_StartingRoomViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _x = 0;
    _roomList = [[NSMutableArray alloc] init];
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    for (int i = 0; i < [[sharedModel nodeList] count]; i++)
    {
        if ([[[[sharedModel nodeList] objectAtIndex:i] building] isEqualToString:[sharedModel startBuilding]] && [[[[sharedModel nodeList] objectAtIndex:i] nodeType] isEqualToString:@"room"])
            [_roomList addObject:[[sharedModel nodeList] objectAtIndex:i]];
    }
    _searchResults = [[NSMutableArray alloc] initWithCapacity:[_roomList count]];
    [self.tableView reloadData];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"            " style:self.editButtonItem target:self action:@selector(nothing:)];
    self.navigationItem.rightBarButtonItem = button1;
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"Home" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:18];
    [button3 setFrame:CGRectMake(0, 0, 200, 45)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    self.navigationItem.titleView = button3;
    [button3 addTarget:self
                action:@selector(home:)
      forControlEvents:UIControlEventTouchUpInside];
}

- (void)home:(id)sender
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [sharedModel reset];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    if (tableView == self.searchDisplayController.searchResultsTableView)
        return [_searchResults count];
    else
        return [_roomList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    // hey look, it's this terrible code again!
    if (tableView == self.searchDisplayController.searchResultsTableView)
        _x = 0;
    else
        _x = 1;
    
    if (_x == 1)
    {
        cell.textLabel.text = [[_roomList objectAtIndex:indexPath.row] name];
    }
    else
    {
        cell.textLabel.text = [[_searchResults objectAtIndex:indexPath.row] name];
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path
{
    return path;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    if (_x == 1)
        [sharedModel setStartNode:[_roomList objectAtIndex:indexPath.row]];
    else
    {
        for (int i = 0; i < [_roomList count]; i++)
        {
            if ([[_roomList objectAtIndex:i] isEqual:[_searchResults objectAtIndex:indexPath.row]])
            {
                [sharedModel setStartNode:[_roomList objectAtIndex:i]];
            }
        }
    }
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers count]-3] animated:YES];
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [_searchResults removeAllObjects];
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    _searchResults = [NSMutableArray arrayWithArray:[_roomList filteredArrayUsingPredicate:predicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    if ([searchString length] == 0)
        _x = 1;
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
