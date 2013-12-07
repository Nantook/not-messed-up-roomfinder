//
//  ICM_StartingRoomViewController.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-12.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICM_StartingRoomViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) NSMutableArray *roomList;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (strong, nonatomic) IBOutlet UISearchBar *startingRoomSearchBar;
@property int x;

@end
