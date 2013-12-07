//
//  ICM_Node.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-18.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Node.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import "ICM_Node.h"
#import <MapKit/MapKit.h>

@implementation ICM_Node

// custom initializer
//
// if default properties are changed, make sure to update this function
- (id)initWithValuesInside:(BOOL)inside Type:(NSString*)type Ground:(BOOL)ground Lattitude:(float)lattitude Longitude:(float)longitude Name:(NSString*)name Building:(NSString*)building FrontImage:(NSString*)front RightImage:(NSString*)right BackImage:(NSString*)back LeftImage:(NSString*)left;
{
    if (self = [super init])
    {
        _inside = inside;
        _nodeType = type;
        _groundLevel = ground;
        _nodeLocation = CLLocationCoordinate2DMake(lattitude, longitude);
        _neighboursAndWeights = [[NSMutableArray alloc] init];
        _name = name;
        _building = building;
        _frontName = front;
        _leftName = left;
        _rightName = right;
        _backName = back;
    }
    return self;
}

- (void)initPanoImages
{
    if (![_frontName isEqualToString:@"none"])
    {
        _frontName = [_frontName stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
        _backName = [_backName stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
        _leftName = [_leftName stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
        _rightName = [_rightName stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
        
        NSString *frontPath = [[NSBundle mainBundle] pathForResource:_frontName ofType:@"jpg"];
        NSString *backPath = [[NSBundle mainBundle] pathForResource:_backName ofType:@"jpg"];
        NSString *leftPath = [[NSBundle mainBundle] pathForResource:_leftName ofType:@"jpg"];
        NSString *rightPath = [[NSBundle mainBundle] pathForResource:_rightName ofType:@"jpg"];
        NSString *topPath = [[NSBundle mainBundle] pathForResource:@"panophoto.top" ofType:@"jpg"];
        NSString *botPath = [[NSBundle mainBundle] pathForResource:@"panophoto.bottom" ofType:@"jpg"];
        
        UIImage *frontImage = [[UIImage alloc] initWithContentsOfFile:frontPath];
        UIImage *backImage = [[UIImage alloc] initWithContentsOfFile:backPath];
        UIImage *leftImage = [[UIImage alloc] initWithContentsOfFile:leftPath];
        UIImage *rightImage = [[UIImage alloc] initWithContentsOfFile:rightPath];
        UIImage *topImage = [[UIImage alloc] initWithContentsOfFile:topPath];
        UIImage *botImage = [[UIImage alloc] initWithContentsOfFile:botPath];
        
        _panoView = [[JAPanoView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
        [_panoView setFrontImage:frontImage rightImage:rightImage backImage:backImage leftImage:leftImage topImage:topImage bottomImage:botImage];
    }
    else
    {
        _panoView = nil;
    }
}

// adds a neighbour to a node
- (void)addNeighbour:(ICM_Node*)node
{
//    CLLocation *locB = [[CLLocation alloc] initWithLatitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].latitude longitude:[[[sharedModel nodeList] objectAtIndex:x] nodeLocation].longitude];
//    
//    
//    CLLocationDistance currentDistance = [locA distanceFromLocation:locB];
    //CLLocationDistance currentDistance = [locA distanceFromLocation:locB];

    CLLocation *locA = [[CLLocation alloc] initWithLatitude:_nodeLocation.latitude longitude:_nodeLocation.longitude];
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:node.nodeLocation.latitude longitude:node.nodeLocation.longitude];
    CLLocationDistance distance1 = [locA distanceFromLocation:locB];
    NSNumber *distance2 = [NSNumber numberWithDouble:distance1];
    [_neighboursAndWeights addObject:[[NSMutableArray alloc] init]];
    [[_neighboursAndWeights objectAtIndex:([_neighboursAndWeights count]-1)] addObject:node];
    [[_neighboursAndWeights objectAtIndex:([_neighboursAndWeights count]-1)] addObject:distance2];
}

@end

