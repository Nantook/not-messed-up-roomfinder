//
//  ICM_NavControllerDelegate.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-11.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_NavControllerDelegate.h"
#import "ICM_FadeTransition.h"

@implementation ICM_NavControllerDelegate

// custom transition between pano images
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{

    if ([fromVC.description rangeOfString:@"ICM_Pano"].location == NSNotFound)
        return nil;
    else
        return [ICM_FadeTransition new];


}

@end
