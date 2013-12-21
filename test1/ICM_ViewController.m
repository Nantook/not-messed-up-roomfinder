//
//  ICM_ViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_ViewController.h"
#import "ICM_Node.h"
#import "ICM_Model.h"

@interface ICM_ViewController ()

@end

@implementation ICM_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    // basic setup stuff
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    ICM_Model *sharedModel = [ICM_Model sharedModel];
    [sharedModel reset];
    [sharedModel setStartNode:nil];
    [sharedModel setEndNode:nil];
}

@end