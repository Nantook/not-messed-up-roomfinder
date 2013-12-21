//
//  ICM_SelectionTypeViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-26.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_SelectionTypeViewController.h"
#import "ICM_Model.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ICM_SelectionTypeViewController ()

@end

@implementation ICM_SelectionTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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


- (void)viewWillAppear:(BOOL)animated
{
   // [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// this function grabs the suers current location and finds the closest node
// to the user
- (IBAction)getGPSLocation:(id)sender
{
    GMSMapView *mapView;
    mapView.myLocationEnabled = YES;
    CLLocation *myLocation = mapView.myLocation;
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:myLocation.coordinate.latitude longitude:myLocation.coordinate.longitude];
    
    
    int closestNodeIndex = -1;
    CLLocationDistance shortestDistance = 999999;
    for (int x = 0; x < [[sharedModel nodeList] count]; x++)
    {
        CLLocation *locB = [[CLLocation alloc] initWithLatitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].latitude longitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].longitude];

        
        CLLocationDistance currentDistance = [locA distanceFromLocation:locB];
        if (currentDistance < shortestDistance)
        {
            shortestDistance = currentDistance;
            closestNodeIndex = x;
        }
        //Distance in Meters
    }    
    
    [sharedModel setStartNode:[[sharedModel nodeList] objectAtIndex:closestNodeIndex]];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
