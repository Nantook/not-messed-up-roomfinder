//
//  ICM_Pano1ViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-11.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Pano1ViewController.h"
#import "JAPanoView.h"
#import "ICM_Model.h"
#define degreesToRadians(x) (x * M_PI / 180.0)

@interface ICM_Pano1ViewController ()
{
    
}
@end

@implementation ICM_Pano1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSLog(@"test");
    return self;
}

- (id)init {
	if (self = [super init])
    {
        
	}
	return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] initPanoImages];
    self.view = [[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] panoView];
    [self calculateView];
}

- (void)calculateView
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    //NSArray *results = [[NSArray alloc] initWithArray:([sharedModel shortestPath])];

    if ([sharedModel accel])
    {
        [[sharedModel motionManager] startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error)
         {
            #define DV_ROTATION_THRESHOLD 0.1f
            #define DV_ROTATION_MULTIPLIERH 0.016f
            #define DV_ROTATION_MULTIPLIERV 0.025f
             double xOffset = (fabs(deviceMotion.rotationRate.y) > DV_ROTATION_THRESHOLD)?deviceMotion.rotationRate.y*DV_ROTATION_MULTIPLIERV:0.f;
             double yOffset = (fabs(deviceMotion.rotationRate.x) > DV_ROTATION_THRESHOLD)?deviceMotion.rotationRate.x*DV_ROTATION_MULTIPLIERH:0.f;
             
             [(JAPanoView*)self.view setHAngle:([(JAPanoView*)self.view hAngle] - xOffset)];
             [(JAPanoView*)self.view setVAngle:([(JAPanoView*)self.view vAngle] + yOffset)];
         }];
    }
    if ([sharedModel pictureIndex] < [[sharedModel shortestPath] count] - 3)
    {
        float angle = [sharedModel getBearingFrom:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex] + 1] nodeLocation]];
        angle = degreesToRadians(angle);
        UIView *hotspot=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        UIImageView *hotspotImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next.png"]];
        [hotspot addSubview:hotspotImage];
        [[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot atHAngle:angle vAngle:(-M_PI_4/2)];
        UITapGestureRecognizer *tapgr=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextPano:)];
        [hotspot addGestureRecognizer:tapgr];
        [(JAPanoView*)self.view setHAngle:angle];
        [(JAPanoView*)self.view setVAngle:0];
    }
    if ([sharedModel pictureIndex] + 1 == [[sharedModel shortestPath] count] - 2)
    {
        float angle = [sharedModel getBearingFrom:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex] + 1] nodeLocation]];
        angle = degreesToRadians(angle);
        float prevBearing = [sharedModel getBearingFrom:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]-1] nodeLocation] To:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] nodeLocation]];
        float nextBearing = [sharedModel getBearingFrom:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]+2] nodeLocation]];
        prevBearing += 360;
        nextBearing += 360;
        NSLog(@"prevBearing = %f  nextBearing = %f", prevBearing, nextBearing);
        bool isLeft, isRight, isStraight;
        isStraight = NO;
        isLeft = NO;
        isRight = NO;
        if (nextBearing < prevBearing + 10 && nextBearing > prevBearing - 10)
            isStraight = YES;
        if (nextBearing < prevBearing)
            isLeft = YES;
        if (nextBearing > prevBearing)
            isRight = YES;
        NSString *messageTop = @"Your destination is approximately";
        CLLocation *locA = [[CLLocation alloc] initWithLatitude:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] nodeLocation].latitude longitude:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] nodeLocation].longitude];
        CLLocation *locB = [[CLLocation alloc] initWithLatitude:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]+1] nodeLocation].latitude longitude:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]+1] nodeLocation].longitude];
        CLLocationDistance currentDistance = [locA distanceFromLocation:locB];

        NSString *messageBot = [NSString stringWithFormat:@"%.2f", currentDistance];
        messageBot = [messageBot stringByAppendingString:@" meters "];
        if (isStraight)
            messageBot = [messageBot stringByAppendingString:@"straight ahead"];
        else if (isLeft)
            messageBot = [messageBot stringByAppendingString:@"ahead on the left"];
        else if (isRight)
            messageBot = [messageBot stringByAppendingString:@"ahead on the right"];

        UILabel *hotspot1=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 25)];
        hotspot1.backgroundColor=[UIColor clearColor];
        hotspot1.textColor=[UIColor whiteColor];
        hotspot1.text=messageTop;
        hotspot1.font = [hotspot1.font fontWithSize:14];
        hotspot1.textAlignment=UITextAlignmentCenter;
        UILabel *hotspot2=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 25)];
        hotspot2.backgroundColor=[UIColor clearColor];
        hotspot2.textColor=[UIColor whiteColor];
        hotspot2.text=messageBot;
        hotspot2.font = [hotspot2.font fontWithSize:14];
        hotspot2.textAlignment=UITextAlignmentCenter;
        [[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot1 atHAngle:angle vAngle:(-M_PI_4/2)-0.20];
        [[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot2 atHAngle:angle vAngle:(-M_PI_4/2)-0.30];
        [(JAPanoView*)self.view setHAngle:angle];
        [(JAPanoView*)self.view setVAngle:0];
        [[self.navigationItem rightBarButtonItem] setEnabled:NO];
    }
    if ([sharedModel pictureIndex] > 1)
    {
        float angle = [sharedModel getBearingFrom:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex] - 1] nodeLocation]];
        angle = degreesToRadians(angle);
        UIView *hotspot=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        UIImageView *hotspotImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
        [hotspot addSubview:hotspotImage];
        [[[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot atHAngle:angle vAngle:(-M_PI_4/2)];
        UITapGestureRecognizer *tapgr=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(prevPano:)];
        [hotspot addGestureRecognizer:tapgr];
    }
    [[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] setPanoView:nil];
}

- (void)viewDidLoad
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [super viewDidLoad];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"Next >" style:self.editButtonItem target:self action:@selector(nextPano:)];
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithTitle:@"< Back" style:self.editButtonItem target:self action:@selector(prevPano:)];
    self.navigationItem.rightBarButtonItem = button1;
    self.navigationItem.leftBarButtonItem = button2;
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"Home" forState:UIControlStateNormal];
    [button3 setFrame:CGRectMake(0, 0, 200, 45)];
    [button3 addTarget:self
                action:@selector(home:)
      forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button3;

    

}

-(void)viewDidAppear:(BOOL)animated
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    //NSArray *results = [[NSArray alloc] initWithArray:([sharedModel shortestPath])];
    if ([sharedModel pictureIndex] + 1 == [[sharedModel shortestPath] count] - 2)
        self.navigationItem.rightBarButtonItem.enabled = NO;
    else
        self.navigationItem.rightBarButtonItem.enabled = YES;

}


-(void) viewWillDisappear:(BOOL)animated
{
//    ICM_Model *sharedModel = [ICM_Model sharedModel];
//    if ([sharedModel pictureIndex] > 1)
//        [self prevPano:self];
//    else
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}

- (void)home:(id)sender
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [sharedModel reset];
    if ([sharedModel accel])
    {
        [[NSOperationQueue currentQueue] cancelAllOperations];
        [[sharedModel motionManager] stopDeviceMotionUpdates];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)nextPano:(id)sender
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    //NSArray *results = [[NSArray alloc] initWithArray:([sharedModel shortestPath])];

    
    UIView *newView = [[UIView alloc] init];
    [[[sharedModel shortestPath] objectAtIndex:([sharedModel pictureIndex]+1)] initPanoImages];
    newView = [[[sharedModel shortestPath] objectAtIndex:([sharedModel pictureIndex]+1)] panoView];
    [[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]] setPanoView:nil];
    newView.alpha = 0.0;
    [self.view addSubview: newView];
    
    [UIView animateWithDuration: 1.0
                     animations:^{
                         self.view.alpha = 0.0;
                         newView.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {}];

    self.view = newView;
    [sharedModel setPictureIndex:([sharedModel pictureIndex] + 1)];
    [self calculateView];
//    NSLog(@"2");

//    NSLog(@"3");
//    if ([sharedModel pictureIndex] + 1 == [[sharedModel shortestPath] count] - 2)
//        self.navigationItem.rightBarButtonItem.enabled = NO;
//    else
//        self.navigationItem.rightBarButtonItem.enabled = YES;
//    if ([sharedModel accel])
//    {
//        [[NSOperationQueue currentQueue] cancelAllOperations];
//        [[sharedModel motionManager] stopDeviceMotionUpdates];
//    }
//    NSLog(@"4");
//    [self calculateView];
//    NSLog(@"5");
    //[self.view setNeedsDisplay];
    
}

- (void)prevPano:(id)sender
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    if ([sharedModel pictureIndex] > 1)
    {
        UIView *newView = [[UIView alloc] init];
        [[[sharedModel shortestPath] objectAtIndex:[sharedModel pictureIndex]-1] initPanoImages];
        newView = [[[sharedModel shortestPath] objectAtIndex:([sharedModel pictureIndex]-1)] panoView];
        newView.alpha = 0.0;
        [self.view addSubview: newView];
        
        [UIView animateWithDuration: 1.0
                         animations:^{
                             self.view.alpha = 0.0;
                             newView.alpha = 1.0;
                         }
                         completion:^(BOOL finished) {}];
        self.view = newView;
        [sharedModel setPictureIndex:([sharedModel pictureIndex] - 1)];
        if ([sharedModel accel])
        {
            [[NSOperationQueue currentQueue] cancelAllOperations];
            [[sharedModel motionManager] stopDeviceMotionUpdates];
        }
        [self calculateView];
    }
    else
        [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
