//
//  ICM_StartingViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//
// loads the building list into a tableview and allows a user to select one

#import "ICM_StartingViewController.h"
#import "ICM_Model.h"

@interface ICM_StartingViewController ()

@end

@implementation ICM_StartingViewController

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
    // basic setup + adding the home button
    [super viewDidLoad];
    _x = 0;
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    _searchResults = [[NSMutableArray alloc] initWithCapacity:[[sharedModel buildingList] count]];
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
	// Do any additional setup after loading the view.
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
        return [[sharedModel buildingList] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    // stupid code that never got refractored
    if (tableView == self.searchDisplayController.searchResultsTableView)
        _x = 0;
    else
        _x = 1;
    
    if (_x == 1)
    {
        cell.textLabel.text = [[sharedModel buildingList] objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [_searchResults objectAtIndex:indexPath.row];
    }

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    if (_x == 1)
        [sharedModel setStartBuilding:[[sharedModel buildingList] objectAtIndex:indexPath.row]];
    else
    {
        for (int i = 0; i < [[sharedModel buildingList] count]; i++)
        {
            if ([[[sharedModel buildingList] objectAtIndex:i] isEqual:[_searchResults objectAtIndex:indexPath.row]])
            {
                [sharedModel setStartBuilding:[[sharedModel buildingList] objectAtIndex:i]];
            }
        }
    }

    [self performSegueWithIdentifier: @"forward" sender: self];
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [_searchResults removeAllObjects];
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains %@",searchText];
    _searchResults = [NSMutableArray arrayWithArray:[[sharedModel buildingList] filteredArrayUsingPredicate:predicate]];
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
