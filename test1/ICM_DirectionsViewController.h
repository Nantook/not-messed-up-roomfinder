//
//  ICM_DirectionsViewController.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

// View Controller for the view that has the path on it where you select your
// start and end locations

#import <UIKit/UIKit.h>

@interface ICM_DirectionsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *destinationButton;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *calculateRouteButton;
@property (strong, nonatomic) IBOutlet UIImageView *mapPath;
@property (strong, nonatomic) IBOutlet UILabel *startLabel;
@property (strong, nonatomic) IBOutlet UILabel *destLabel;
@property (nonatomic, strong) NSDate *buttonTouchDownDate;

- (IBAction)calculateRoute:(id)sender;
- (void)calculateStuff;

@end
