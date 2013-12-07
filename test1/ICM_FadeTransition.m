//
//  ICM_FadeTransition.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-11-11.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_FadeTransition.h"

@implementation ICM_FadeTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    // Get the two view controllers
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get the container view - where the animation has to happen
    UIView *containerView = [transitionContext containerView];
    
    // Add the two VC views to the container. Hide the to
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    toVC.view.alpha = 0.0;
    
    // Perform the animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:0
                     animations:^{
                         toVC.view.alpha = 1.f;
                     }
                     completion:^(BOOL finished) {
                         // Let's get rid of the old VC view
                         [fromVC.view removeFromSuperview];
                         // And then we need to tell the context that we're done
                         [transitionContext completeTransition:YES];
                     }];
    
}

@end
