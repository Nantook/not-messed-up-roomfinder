//
//  ICM_Pano2ViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-11.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Pano2ViewController.h"
#import "JAPanoView.h"
#import "ICM_Model.h"
#define degreesToRadians(x) (x * M_PI / 180.0)

@interface ICM_Pano2ViewController ()

@end

@implementation ICM_Pano2ViewController

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
    NSArray *results = [[NSArray alloc] initWithArray:([sharedModel shortestPath])];
    
    if ([sharedModel pictureIndex] < [results count] - 3)
    {
        float angle = [sharedModel getBearingFrom:[[results objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[results objectAtIndex:[sharedModel pictureIndex] + 1] nodeLocation]];
        angle = degreesToRadians(angle);
        UIView *hotspot=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        UIImageView *hotspotImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"upArrowGreen.png"]];
        [hotspot addSubview:hotspotImage];
        [[[results objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot atHAngle:angle vAngle:(-M_PI_4/2)];
        UITapGestureRecognizer *tapgr=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextPano:)];
        [hotspot addGestureRecognizer:tapgr];
        [(JAPanoView*)self.view setHAngle:angle];
        [(JAPanoView*)self.view setVAngle:0];
    }
    //    if ([sharedModel pictureIndex] + 1 == [results count] - 2)
    //    {
    //        float angle = [sharedModel getBearingFrom:[[results objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[results objectAtIndex:[sharedModel pictureIndex] + 1] nodeLocation]];
    //        angle = degreesToRadians(angle);
    //        float prevBearing = [sharedModel getBearingFrom:[[results objectAtIndex:[sharedModel pictureIndex]-1] nodeLocation] To:[[results objectAtIndex:[sharedModel pictureIndex]] nodeLocation]];
    //        float nextBearing = [sharedModel getBearingFrom:[[results objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[results objectAtIndex:[sharedModel pictureIndex]+2] nodeLocation]];
    //        prevBearing += 360;
    //        nextBearing += 360;
    //        bool isLeft, isStraight;
    //        isStraight = NO;
    //        isLeft = NO;
    //        if (nextBearing < prevBearing + 10 && nextBearing > prevBearing - 10)
    //            isStraight = YES;
    //        else if (nextBearing < prevBearing)
    //            isLeft = YES;
    //        NSString *messageTop = @"Your destination is approximately";
    //        CLLocation *locA = [[CLLocation alloc] initWithLatitude:[[results objectAtIndex:[sharedModel pictureIndex]] nodeLocation].latitude longitude:[[results objectAtIndex:[sharedModel pictureIndex]] nodeLocation].longitude];
    //        CLLocation *locB = [[CLLocation alloc] initWithLatitude:[[results objectAtIndex:[sharedModel pictureIndex]+1] nodeLocation].latitude longitude:[[results objectAtIndex:[sharedModel pictureIndex]+1] nodeLocation].longitude];
    //        CLLocationDistance currentDistance = [locA distanceFromLocation:locB];
    //
    //        NSString *messageBot = [NSString stringWithFormat:@"%.2f", currentDistance];
    //        messageBot = [messageBot stringByAppendingString:@" meters "];
    //        if (isStraight)
    //            messageBot = [messageBot stringByAppendingString:@"straight ahead"];
    //        else if (isLeft)
    //            messageBot = [messageBot stringByAppendingString:@"ahead on the left"];
    //        else
    //            messageBot = [messageBot stringByAppendingString:@"ahead on the right"];
    //
    //        UILabel *hotspot1=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 25)];
    //        hotspot1.backgroundColor=[UIColor clearColor];
    //        hotspot1.textColor=[UIColor whiteColor];
    //        hotspot1.text=messageTop;
    //        hotspot1.font = [hotspot1.font fontWithSize:14];
    //        hotspot1.textAlignment=UITextAlignmentCenter;
    //        UILabel *hotspot2=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 25)];
    //        hotspot2.backgroundColor=[UIColor clearColor];
    //        hotspot2.textColor=[UIColor whiteColor];
    //        hotspot2.text=messageBot;
    //        hotspot2.font = [hotspot2.font fontWithSize:14];
    //        hotspot2.textAlignment=UITextAlignmentCenter;
    //        [[[results objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot1 atHAngle:angle vAngle:(-M_PI_4/2)-0.20];
    //        [[[results objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot2 atHAngle:angle vAngle:(-M_PI_4/2)-0.30];
    //        [(JAPanoView*)self.view setHAngle:angle];
    //        [(JAPanoView*)self.view setVAngle:0];
    //    }
    if ([sharedModel pictureIndex] > 1)
    {
        float angle = [sharedModel getBearingFrom:[[results objectAtIndex:[sharedModel pictureIndex]] nodeLocation] To:[[results objectAtIndex:[sharedModel pictureIndex] - 1] nodeLocation]];
        angle = degreesToRadians(angle);
        UIView *hotspot=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        UIImageView *hotspotImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"upArrowRed.png"]];
        [hotspot addSubview:hotspotImage];
        [[[results objectAtIndex:[sharedModel pictureIndex]] panoView] addHotspot:hotspot atHAngle:angle vAngle:(-M_PI_4/2)];
        UITapGestureRecognizer *tapgr=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(prevPano:)];
        [hotspot addGestureRecognizer:tapgr];
    }
    self.view = [[results objectAtIndex:[sharedModel pictureIndex]] panoView];
}

- (void)viewDidLoad
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [super viewDidLoad];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:self.editButtonItem target:self action:@selector(nextPano:)];
    self.navigationItem.rightBarButtonItem = button1;
    if ([sharedModel pictureIndex] < [[sharedModel shortestPath] count] - 1)
        self.navigationItem.rightBarButtonItem.enabled = YES;
    else
        self.navigationItem.rightBarButtonItem.enabled = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    //    ICM_Model *sharedModel = [ICM_Model sharedModel];
    //    [[sharedModel motionManager] startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error)
    //     {
    //         #define DV_ROTATION_THRESHOLD 0.1f
    //         #define DV_ROTATION_MULTIPLIERH 0.016f
    //         #define DV_ROTATION_MULTIPLIERV 0.025f
    //         double xOffset = (fabs(deviceMotion.rotationRate.y) > DV_ROTATION_THRESHOLD)?deviceMotion.rotationRate.y*DV_ROTATION_MULTIPLIERV:0.f;
    //         double yOffset = (fabs(deviceMotion.rotationRate.x) > DV_ROTATION_THRESHOLD)?deviceMotion.rotationRate.x*DV_ROTATION_MULTIPLIERH:0.f;
    //
    //         [(JAPanoView*)self.view setHAngle:([(JAPanoView*)self.view hAngle] - xOffset)];
    //         [(JAPanoView*)self.view setVAngle:([(JAPanoView*)self.view vAngle] + yOffset)];
    //     }];
}


-(void) viewWillDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound)
    {
        ICM_Model *sharedModel = [ICM_Model sharedModel];
        if ([sharedModel pictureIndex] > 0)
            [sharedModel setPictureIndex:([sharedModel pictureIndex] - 1)];
    }
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.view = nil;
}

- (void)nextPano:(id)sender
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [sharedModel setPictureIndex:([sharedModel pictureIndex] + 1)];

    //    [[NSOperationQueue currentQueue] cancelAllOperations];
    //    [[sharedModel motionManager] stopDeviceMotionUpdates];
    [self performSegueWithIdentifier: @"forward" sender: self];
}

- (void)prevPano:(id)sender
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    //    [[NSOperationQueue currentQueue] cancelAllOperations];
    //    [[sharedModel motionManager] stopDeviceMotionUpdates];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
