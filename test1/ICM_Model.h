//
//  ICM_Model.h
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//
// the big bad model

#import <Foundation/Foundation.h>
#import "ICM_Node.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

@interface ICM_Model : NSObject

@property (nonatomic) NSMutableArray *buildingList;
@property (nonatomic) NSMutableArray *nodeList;
@property (nonatomic) NSMutableArray *adjacancyMatrix;
@property (nonatomic) ICM_Node *startNode;
@property (nonatomic) ICM_Node *endNode;
@property (nonatomic) NSString *startBuilding;
@property (nonatomic) NSString *endBuilding;
@property (nonatomic) NSArray *shortestPath;
@property (nonatomic) int pictureIndex;
@property (nonatomic) CMMotionManager *motionManager;
@property (nonatomic) BOOL accel;

+ (id)sharedModel;
- (void)reset;
- (NSArray*)pruneResults;
- (void)addStartNode:(ICM_Node*)nodel;
- (NSArray*)dijsktra:(ICM_Node*)startNode EndNode:(ICM_Node*)endNode;
- (float)getBearingFrom:(CLLocationCoordinate2D)from To:(CLLocationCoordinate2D)to;

@end
