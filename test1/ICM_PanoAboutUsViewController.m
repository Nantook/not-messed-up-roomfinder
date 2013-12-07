//
//  ICM_PanoAboutUsViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-12-04.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_PanoAboutUsViewController.h"
#import "JAPanoView.h"
#import "ICM_Model.h"

@interface ICM_PanoAboutUsViewController ()

@end

@implementation ICM_PanoAboutUsViewController

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
    JAPanoView *panoView=[[JAPanoView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
    self.view=panoView;
    [panoView setFrontImage:[UIImage imageNamed:@"panophoto.bottom.jpg"] rightImage:[UIImage imageNamed:@"settingsFrontBack.png"] backImage:[UIImage imageNamed:@"panophoto.bottom.jpg"] leftImage:[UIImage imageNamed:@"settingsFrontBack.png"] topImage:[UIImage imageNamed:@"settingsBot.png"] bottomImage:[UIImage imageNamed:@"settingsBot.png"]];
    
    UILabel *hotspot1=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot1.backgroundColor=[UIColor clearColor];
    hotspot1.textColor=[UIColor whiteColor];
    hotspot1.font = [hotspot1.font fontWithSize:25];
    hotspot1.text=@"Brett Nishikawa";
    hotspot1.textAlignment=UITextAlignmentCenter;
    UILabel *hotspot6=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot6.backgroundColor=[UIColor clearColor];
    hotspot6.textColor=[UIColor whiteColor];
    hotspot6.font = [hotspot6.font fontWithSize:25];
    hotspot6.text=@"Brett Nishikawa";
    hotspot6.textAlignment=UITextAlignmentCenter;
    [panoView addHotspot:hotspot1 atHAngle:0 vAngle:((2.0/6.0)*M_PI_2)];
    [panoView addHotspot:hotspot6 atHAngle:M_PI vAngle:((2.0/6.0)*M_PI_2)];
    UILabel *hotspot2=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot2.backgroundColor=[UIColor clearColor];
    hotspot2.textColor=[UIColor whiteColor];
    hotspot2.font = [hotspot2.font fontWithSize:25];
    hotspot2.text=@"Rodrigo Silva";
    hotspot2.textAlignment=UITextAlignmentCenter;
    UILabel *hotspot7=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot7.backgroundColor=[UIColor clearColor];
    hotspot7.textColor=[UIColor whiteColor];
    hotspot7.font = [hotspot7.font fontWithSize:25];
    hotspot7.text=@"Rodrigo Silva";
    hotspot7.textAlignment=UITextAlignmentCenter;
    [panoView addHotspot:hotspot7 atHAngle:0 vAngle:((1.0/6.0)*M_PI_2)];
    [panoView addHotspot:hotspot2 atHAngle:M_PI vAngle:((1.0/6.0)*M_PI_2)];
    UILabel *hotspot8=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot8.backgroundColor=[UIColor clearColor];
    hotspot8.textColor=[UIColor whiteColor];
    hotspot8.font = [hotspot8.font fontWithSize:25];
    hotspot8.text=@"Pierre Beldor";
    hotspot8.textAlignment=UITextAlignmentCenter;
    UILabel *hotspot3=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot3.backgroundColor=[UIColor clearColor];
    hotspot3.textColor=[UIColor whiteColor];
    hotspot3.font = [hotspot3.font fontWithSize:25];
    hotspot3.text=@"Pierre Beldor";
    hotspot3.textAlignment=UITextAlignmentCenter;
    [panoView addHotspot:hotspot3 atHAngle:0 vAngle:(-(1.0/6.0)*M_PI_2)];
    [panoView addHotspot:hotspot8 atHAngle:M_PI vAngle:(-(1.0/6.0)*M_PI_2)];
    UILabel *hotspot4=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot4.backgroundColor=[UIColor clearColor];
    hotspot4.textColor=[UIColor whiteColor];
    hotspot4.font = [hotspot4.font fontWithSize:25];
    hotspot4.text=@"Hussein Al-Kaf";
    hotspot4.textAlignment=UITextAlignmentCenter;
    UILabel *hotspot9=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot9.backgroundColor=[UIColor clearColor];
    hotspot9.textColor=[UIColor whiteColor];
    hotspot9.font = [hotspot9.font fontWithSize:25];
    hotspot9.text=@"Hussein Al-Kaf";
    hotspot9.textAlignment=UITextAlignmentCenter;
    [panoView addHotspot:hotspot9 atHAngle:0 vAngle:(-(2.0/6.0)*M_PI_2)];
    [panoView addHotspot:hotspot4 atHAngle:M_PI vAngle:(-(2.0/6.0)*M_PI_2)];
    
    UILabel *hotspot5=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot5.backgroundColor=[UIColor clearColor];
    hotspot5.textColor=[UIColor whiteColor];
    hotspot5.font = [hotspot5.font fontWithSize:60];
    hotspot5.text=@"ICM";
    hotspot5.textAlignment=UITextAlignmentCenter;
    UILabel *hotspot0=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    hotspot0.backgroundColor=[UIColor clearColor];
    hotspot0.textColor=[UIColor whiteColor];
    hotspot0.font = [hotspot0.font fontWithSize:60];
    hotspot0.text=@"ICM";
    hotspot0.textAlignment=UITextAlignmentCenter;
    [panoView addHotspot:hotspot0 atHAngle:M_PI_2 vAngle:0];
    [panoView addHotspot:hotspot5 atHAngle:(M_PI_2 + M_PI) vAngle:0];

    ICM_Model *sharedModel = [ICM_Model sharedModel];
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
}

- (void)viewDidDisappear:(BOOL)animated
{
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    if ([sharedModel accel])
    {
        [[NSOperationQueue currentQueue] cancelAllOperations];
        [[sharedModel motionManager] stopDeviceMotionUpdates];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
