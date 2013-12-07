//
//  ICM_DirectionsViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_DirectionsViewController.h"
#import "ICM_Model.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ICM_DirectionsViewController ()

@end

@implementation ICM_DirectionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)startPressed:(id)sender
{
    self.buttonTouchDownDate = [NSDate date];
}

- (IBAction)startReleased:(id)sender
{
    NSTimeInterval timeInterval = ABS([self.buttonTouchDownDate timeIntervalSinceNow]);
    if (timeInterval > 2)
    {
        GMSMapView *mapView;
        mapView.myLocationEnabled = YES;
        CLLocation *myLocation = mapView.myLocation;
        ICM_Model *sharedModel = [ICM_Model sharedModel];
        
        // uncomment this for actual GPS info
        CLLocation *locA = [[CLLocation alloc] initWithLatitude:myLocation.coordinate.latitude longitude:myLocation.coordinate.longitude];
        
        // dummy info
        // 51.078134,-114.127758 = node 3 closest
        //    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.078134 longitude:-114.127758];
        //    // 51.077789,-114.127436 = node 2 closest
        //    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.077789 longitude:-114.127436];
        //    // 51.077711,-114.127978 = node 1 closest
        //    CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.077711 longitude:-114.127978];
        //    // 51.077891,-114.128463 = node 0 closest
        //CLLocation *locA = [[CLLocation alloc] initWithLatitude:51.077891 longitude:-114.128463];
        
        int closestNodeIndex = -1;
        CLLocationDistance shortestDistance = -1;
        for (int x = 0; x < [[sharedModel nodeList] count]; x++)
        {
            CLLocation *locB = [[CLLocation alloc] initWithLatitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].latitude longitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].longitude];
            
            
            CLLocationDistance currentDistance = [locA distanceFromLocation:locB];
            if (currentDistance < shortestDistance || shortestDistance == -1)
            {
                shortestDistance = currentDistance;
                closestNodeIndex = x;
            }
            //Distance in Meters
        }
        // NSLog(@"Closest Node Name = %@", [[[sharedModel nodeList] objectAtIndex:closestNodeIndex] name]);
        
        [sharedModel setStartNode:[[sharedModel nodeList] objectAtIndex:closestNodeIndex]];
        [self calculateStuff];
    }
    else
    {
        [self performSegueWithIdentifier: @"selectStart" sender: self];
    }
}

- (void)calculateStuff
{
    
    self.navigationController.navigationBarHidden = NO;
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    if (![[sharedModel startNode] isEqual:[sharedModel endNode]])
    {
        if ([sharedModel startNode])
        {
            NSString *text = @"From: ";
            text = [text stringByAppendingString:[[sharedModel startNode] name]];
            [_startLabel setText:text];
            //            [_startButton setTitle:[NSString stringWithFormat:@"From: %@", [[sharedModel startNode  ] name]] forState: UIControlStateNormal];
        }
        if ([sharedModel endNode])
        {
            NSString *text = @"To: ";
            text = [text stringByAppendingString:[[sharedModel endNode] name]];
            [_destLabel setText:text];
            //            [_destinationButton setTitle:[NSString stringWithFormat:@"To: %@", [[sharedModel    endNode] name]] forState: UIControlStateNormal];
            //        _destinationButton.text = [[sharedModel endNode] name];
            ///       _destinationButton.textAlignment = NSTextAlignmentCenter;
        }
        if ([sharedModel startNode] && [sharedModel endNode])
        {
            _calculateRouteButton.hidden = NO;
            _calculateRouteButton.enabled = YES;
        }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection Error"
                                                        message:@"Start and Ending Selections are the same. Please try again"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [sharedModel setStartNode:nil];
        [sharedModel setEndNode:nil];
        [_startLabel setText:@"<< Click on the pin to select the start location"];
        [_destLabel setText:@"Click on the pin to select the destination location >>"];
        //        [_startButton setTitle:@"Select Start Location" forState: UIControlStateNormal];
        //        [_destinationButton setTitle:@"Select Destination" forState: UIControlStateNormal];
    }
    [self.view setNeedsDisplay];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self calculateStuff];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _calculateRouteButton.hidden = YES;
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

- (IBAction)calculateRoute:(id)sender
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    _calculateRouteButton.enabled = NO;
    
    

    UIActivityIndicatorView *activityIndicator=[[UIActivityIndicatorView alloc] init];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.center=[self view].center;
    [[self view] addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    self.view.alpha = 0.25;

    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    [sharedModel setShortestPath:[sharedModel dijsktra:[sharedModel startNode] EndNode:[sharedModel endNode]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityIndicator stopAnimating];
            bool test = NO;
            for (int i = 0; i < [[sharedModel shortestPath] count]; i++)
            {
                if ([[[[sharedModel shortestPath] objectAtIndex:i] nodeType] isEqualToString:@"movement"])
                    test = YES;
            }
            if (test)
            {
                self.view.alpha = 1;
                [self performSegueWithIdentifier: @"forward" sender: self];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection Error"
                                                                message:@"No Panorama Photos Between These Points"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                [sharedModel setStartNode:nil];
                [sharedModel setEndNode:nil];
                [_startLabel setText:@"<< Click on the pin to select the start location"];
                [_destLabel setText:@"Click on the pin to select the destination location >>"];
                [self.view setNeedsDisplay];
            }
            ;
        });
    });


    



//    NSLog(@"%@ %@ %@", [[results objectAtIndex:0] name], [[results objectAtIndex:1] name], [[results objectAtIndex:2] name]);
}
@end
