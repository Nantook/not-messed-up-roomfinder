//
//  ICM_EndingRoomViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-12.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_EndingRoomViewController.h"
#import "ICM_Model.h"

@interface ICM_EndingRoomViewController ()

@end

@implementation ICM_EndingRoomViewController

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
        if ([[[[sharedModel nodeList] objectAtIndex:i] building] isEqualToString:[sharedModel endBuilding]] && [[[[sharedModel nodeList] objectAtIndex:i] nodeType] isEqualToString:@"room"])
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
        return [_roomList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    if (tableView == self.searchDisplayController.searchResultsTableView)
        _x = 0;
    else
        _x = 1;
    
    if (_x == 1)
    {
        cell.textLabel.text = [[_roomList objectAtIndex:indexPath.row] name];
        //        if ([[sharedModel endNode] isEqual:[[sharedModel nodeList] objectAtIndex:indexPath.row]])
        //        {
        //            cell.textLabel.textColor = [UIColor lightGrayColor];
        //        }
    }
    else
    {
        cell.textLabel.text = [[_searchResults objectAtIndex:indexPath.row] name];
        //        if ([[sharedModel endNode] isEqual:[_searchResults objectAtIndex:indexPath.row]])
        //        {
        //            cell.textLabel.textColor = [UIColor lightGrayColor];
        //        }
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path
{
    // Determine if row is selectable based on the NSIndexPath.
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    //    if ([[sharedModel endNode] isEqual:[[sharedModel nodeList] objectAtIndex:path.row]])
    //    {
    //        return nil;
    //    }
    
    return path;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    if (_x == 1)
        [sharedModel setEndNode:[_roomList objectAtIndex:indexPath.row]];
    else
    {
        for (int i = 0; i < [_roomList count]; i++)
        {
            if ([[_roomList objectAtIndex:i] isEqual:[_searchResults objectAtIndex:indexPath.row]])
            {
                [sharedModel setEndNode:[_roomList objectAtIndex:i]];
            }
        }
    }
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers count]-3] animated:YES];
    //[self.navigationController popViewControllerAnimated:YES];
    
    //    NSLog(@"Name of start node = %@", [[sharedModel startNode] name]);
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
