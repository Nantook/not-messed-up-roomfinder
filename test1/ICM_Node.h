//
//  ICM_Node.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-18.
//  Copyright (c) 2013 ICM. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "JAPanoView.h"


@interface ICM_Node : NSObject

@property (nonatomic, getter = isInside) BOOL inside;
@property (nonatomic) NSString *nodeType;
@property (nonatomic, getter = isGroundLevel) BOOL groundLevel;
@property (nonatomic, getter = isRoom) BOOL roomNode;
@property (nonatomic) CLLocationCoordinate2D nodeLocation;
@property (strong, nonatomic) JAPanoView *panoView;
// neighboursAndWeights is a 2d array where the first column is the node connected to it
// and the second column is the distance
@property (strong, nonatomic) NSMutableArray *neighboursAndWeights;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *building;
@property (strong, nonatomic) NSString *frontName;
@property (strong, nonatomic) NSString *leftName;
@property (strong, nonatomic) NSString *rightName;
@property (strong, nonatomic) NSString *backName;

- (id)initWithValuesInside:(BOOL)inside
                      Type:(NSString*)type
                    Ground:(BOOL)ground
                 Lattitude:(float)lattitude
                 Longitude:(float)longitude
                      Name:(NSString*)name
                  Building:(NSString*)building
                FrontImage:(NSString*)front
                RightImage:(NSString*)Right
                 BackImage:(NSString*)back
                 LeftImage:(NSString*)left;

- (void)addNeighbour:(ICM_Node*)node;
- (void)initPanoImages;

@end

