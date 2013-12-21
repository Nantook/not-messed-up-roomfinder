//
//  ICM_RouteMapViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-27.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_RouteMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "ICM_Model.h"

@interface ICM_RouteMapViewController ()

@end

@implementation ICM_RouteMapViewController
{
    GMSMapView *mapView_;
    GMSCoordinateBounds *bounds;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// loads a google map view with the shortest path displayed on it
- (void)loadView {
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[sharedModel startNode] nodeLocation].latitude
                                                            longitude:[[sharedModel startNode] nodeLocation].longitude
                                                                 zoom:18];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];

    GMSMutablePath *path = [GMSMutablePath path];
    for (int i = 0; i < [[sharedModel shortestPath] count]; i++)
    {
        [path addCoordinate:[[[sharedModel shortestPath] objectAtIndex:i] nodeLocation]];
    }
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.strokeWidth = 10;
    polyline.map = mapView_;
    
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    marker1 = [GMSMarker markerWithPosition:[[[sharedModel shortestPath] objectAtIndex:0] nodeLocation]];
    marker1.title = @"Start";
    marker1.map = mapView_;

    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2 = [GMSMarker markerWithPosition:[[[sharedModel shortestPath] lastObject] nodeLocation]];
    marker2.title = @"Finish";
    marker2.map = mapView_;
    
    bounds = [[GMSCoordinateBounds alloc] initWithPath:path];

    GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds];
    
    self.view = mapView_;
    
    [sharedModel setShortestPath:[sharedModel pruneResults]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"Begin" style:self.editButtonItem target:self action:@selector(beginButtonPressed:)];
    self.navigationItem.rightBarButtonItem = button1;

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"Home" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:18];
    [button3 setFrame:CGRectMake(0, 0, 200, 45)];
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


- (void)viewDidAppear:(BOOL)animated
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [sharedModel setPictureIndex:1];
    GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds];
    
    [mapView_ moveCamera:update];
}

- (void)beginButtonPressed:(id)sender
{
    [self performSegueWithIdentifier: @"forward" sender: self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
