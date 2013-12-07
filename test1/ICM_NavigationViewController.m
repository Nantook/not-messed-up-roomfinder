//
//  ICM_NavigationViewController.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-11.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_NavigationViewController.h"
#import "ICM_NavControllerDelegate.h"

@interface ICM_NavigationViewController ()
{
    id<UINavigationControllerDelegate> _navDelegate;
}
@end

@implementation ICM_NavigationViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        _navDelegate = [ICM_NavControllerDelegate new];
        self.delegate = _navDelegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
