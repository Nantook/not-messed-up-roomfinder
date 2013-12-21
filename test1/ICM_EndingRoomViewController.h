//
//  ICM_EndingRoomViewController.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-12.
//  Copyright (c) 2013 ICM. All rights reserved.
//

// view controller for the ending room selection

#import <UIKit/UIKit.h>

@interface ICM_EndingRoomViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *roomList;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (strong, nonatomic) IBOutlet UISearchBar *endingRoomSearchBar;
@property int x;

@end
