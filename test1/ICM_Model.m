//
//  ICM_Model.m
//  RoomFinder
//
//  Created by Brett Nishikawa on 2013-10-17.
//  Copyright (c) 2013 ICM. All rights reserved.
//

#import "ICM_Model.h"
#import "ICM_Node.h"
#define degreesToRadians(x) (M_PI * x / 180.0)
#define radiandsToDegrees(x) (x * 180.0 / M_PI)

@implementation ICM_Model


// reset the user changeable data
- (void)reset
{
    _accel = YES;
    _startNode = Nil;
    _endNode = Nil;
    _startBuilding = Nil;
    _endBuilding = Nil;
    _pictureIndex = 1;
}

- (id)init
{
    if (self = [super init])
    {
        _motionManager = [[CMMotionManager alloc] init];
        [_motionManager setDeviceMotionUpdateInterval:1.0/60.0];

        
        _pictureIndex = 1;
        _shortestPath = [[NSArray alloc] init];
        // default list of buildings
        _buildingList = [[NSMutableArray alloc] init];
        [_buildingList addObject:@"MFH - Murray Fraser Hall"];
        [_buildingList addObject:@"MS - Mathematical Science"];
        [_buildingList addObject:@"ST - Science Theatres"];
        [_buildingList addObject:@"CH - Craigie Hall"];
               
        _nodeList = [[NSMutableArray alloc] init];


// 0
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.08002
                                                          Longitude:-114.127763
                                                               Name:@"0"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0711.back.jpg"
                                                         RightImage:@"IMG_0711.left.jpg"
                                                          BackImage:@"IMG_0711.front.jpg"
                                                          LeftImage:@"IMG_0711.right.jpg"]];
// 1
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127761
                                                               Name:@"1"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0712.back.jpg"
                                                         RightImage:@"IMG_0712.left.jpg"
                                                          BackImage:@"IMG_0712.front.jpg"
                                                          LeftImage:@"IMG_0712.right.jpg"]];
// 2
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127726
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 3
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127686
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 4
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127659
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 5
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.12761
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 6
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127562
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 7
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127498
                                                               Name:@"7"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0713.back.jpg"
                                                         RightImage:@"IMG_0713.left.jpg"
                                                          BackImage:@"IMG_0713.front.jpg"
                                                          LeftImage:@"IMG_0713.right.jpg"]];
// 8
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.127498
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 9
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.080026
                                                          Longitude:-114.127447
                                                               Name:@"9"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0714.back.jpg"
                                                         RightImage:@"IMG_0714.left.jpg"
                                                          BackImage:@"IMG_0714.front.jpg"
                                                          LeftImage:@"IMG_0714.right.jpg"]];
// 10
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.127498
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 11
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127498
                                                               Name:@"11"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0715.back.jpg"
                                                         RightImage:@"IMG_0715.left.jpg"
                                                          BackImage:@"IMG_0715.front.jpg"
                                                          LeftImage:@"IMG_0715.right.jpg"]];
// 12
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127543
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 13
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.12761
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 14
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127659
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 15
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127686
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 16
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127716
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 17
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127761
                                                               Name:@"17"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0716.back.jpg"
                                                         RightImage:@"IMG_0716.left.jpg"
                                                          BackImage:@"IMG_0716.front.jpg"
                                                          LeftImage:@"IMG_0716.right.jpg"]];
// 18
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127798
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 19
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127836
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 20
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127857
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 21
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127905
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 22
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127962
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 23
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.127997
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 24
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.12804
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 25
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.128085
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 26
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.128144
                                                               Name:@"26"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0717.back.jpg"
                                                         RightImage:@"IMG_0717.left.jpg"
                                                          BackImage:@"IMG_0717.front.jpg"
                                                          LeftImage:@"IMG_0717.right.jpg"]];
// 27
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.128192
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 28
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.128233
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 29
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.128262
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 30
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.128313
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 31
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079962
                                                          Longitude:-114.128364
                                                               Name:@"MS 31"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0718.back.jpg"
                                                         RightImage:@"IMG_0718.left.jpg"
                                                          BackImage:@"IMG_0718.front.jpg"
                                                          LeftImage:@"IMG_0718.right.jpg"]];
// 32
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.128364
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 33
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.080026
                                                          Longitude:-114.128364
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 34
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.128364
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 35
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128364
                                                               Name:@"MS 35"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0719.back.jpg"
                                                         RightImage:@"IMG_0719.left.jpg"
                                                          BackImage:@"IMG_0719.front.jpg"
                                                          LeftImage:@"IMG_0719.right.jpg"]];
// 36
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128313
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 37
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128262
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 38
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128233
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 39
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128192
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 40
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128144
                                                               Name:@"40"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0720.back.jpg"
                                                         RightImage:@"IMG_0720.left.jpg"
                                                          BackImage:@"IMG_0720.front.jpg"
                                                          LeftImage:@"IMG_0720.right.jpg"]];
// 41
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.080026
                                                          Longitude:-114.128144
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 42
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.128144
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 43
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128085
                                                               Name:@"43"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0721.back.jpg"
                                                         RightImage:@"IMG_0721.left.jpg"
                                                          BackImage:@"IMG_0721.front.jpg"
                                                          LeftImage:@"IMG_0721.right.jpg"]];
// 44
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127997
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 45
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127962
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 46
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127857
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 47
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.127820
                                                               Name:@"MS 3rd floor hallway"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 48
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.128085
                                                               Name:@"Main Elevator"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 49
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127997
                                                               Name:@"Main Stairs"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 50
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.128192
                                                               Name:@"Female Bathroom"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 51
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128233
                                                               Name:@"Male Bathroom"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 52
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127962
                                                               Name:@"MS 314"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 53
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.127962
                                                               Name:@"MS 315"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 54
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.127857
                                                               Name:@"MS 317"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 55
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127857
                                                               Name:@"MS 318"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 56
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127820
                                                               Name:@"MS 320"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 57
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127761
                                                               Name:@"MS 324"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 58
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.127659
                                                               Name:@"MS 325"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 59
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127726
                                                               Name:@"MS 326"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 60
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127686
                                                               Name:@"MS 328"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 61
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127659
                                                               Name:@"MS 330"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 62
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.12761
                                                               Name:@"MS 332"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 63
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127562
                                                               Name:@"MS 334"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 64
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.127498
                                                               Name:@"MS 336"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 65
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.127543
                                                               Name:@"MS 337"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 66
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.127447
                                                               Name:@"East Stairwell"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 67
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.127447
                                                               Name:@"East Elevator"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 68
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.127543
                                                               Name:@"MS 337A"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 69
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127498
                                                               Name:@"MS 340"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 70
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127543
                                                               Name:@"MS 342"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 71
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.12761
                                                               Name:@"MS 344"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 72
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127659
                                                               Name:@"MS 346"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 73
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127686
                                                               Name:@"MS 348"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 74
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127716
                                                               Name:@"MS 350"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 75
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127761
                                                               Name:@"MS 352"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 76
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127798
                                                               Name:@"MS 354"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 77
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127836
                                                               Name:@"MS 356"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 78
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127857
                                                               Name:@"MS 358"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 79
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127905
                                                               Name:@"MS 360"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 80
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127962
                                                               Name:@"MS 362"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 81
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.127997
                                                               Name:@"MS 364"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 82
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.127962
                                                               Name:@"MS 365"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 83
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.12804
                                                               Name:@"MS 366"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 84
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080026
                                                          Longitude:-114.128085
                                                               Name:@"MS 367"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 85
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.128085
                                                               Name:@"MS 368"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 86
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.128085
                                                               Name:@"MS 369"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 87
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.128144
                                                               Name:@"MS 370"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 88
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.128262
                                                               Name:@"MS 371"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 89
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.128192
                                                               Name:@"MS 372"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 90
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.128233
                                                               Name:@"MS 374"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 91
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.128262
                                                               Name:@"MS 376"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 92
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.128313
                                                               Name:@"MS 378"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 93
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079935
                                                          Longitude:-114.128364
                                                               Name:@"MS 380"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 94
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079986
                                                          Longitude:-114.12841
                                                               Name:@"West Stairwell"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 95
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080026
                                                          Longitude:-114.12841
                                                               Name:@"MS 382"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 96
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.12841
                                                               Name:@"MS 384"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 97
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128364
                                                               Name:@"MS 386"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 98
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.128313
                                                               Name:@"MS 387"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 99
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128313
                                                               Name:@"MS 388"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 100
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080069
                                                          Longitude:-114.128262
                                                               Name:@"MS 389"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 101
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"MS 390"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
        
        [[_nodeList objectAtIndex:0] addNeighbour:[_nodeList objectAtIndex:1]];
        
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:47]];
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:0]];
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:2]];
        
        [[_nodeList objectAtIndex:2] addNeighbour:[_nodeList objectAtIndex:1]];
        [[_nodeList objectAtIndex:2] addNeighbour:[_nodeList objectAtIndex:3]];
        
        [[_nodeList objectAtIndex:3] addNeighbour:[_nodeList objectAtIndex:2]];
        [[_nodeList objectAtIndex:3] addNeighbour:[_nodeList objectAtIndex:4]];
        
        [[_nodeList objectAtIndex:4] addNeighbour:[_nodeList objectAtIndex:3]];
        [[_nodeList objectAtIndex:4] addNeighbour:[_nodeList objectAtIndex:5]];
        
        [[_nodeList objectAtIndex:5] addNeighbour:[_nodeList objectAtIndex:4]];
        [[_nodeList objectAtIndex:5] addNeighbour:[_nodeList objectAtIndex:6]];
        
        [[_nodeList objectAtIndex:6] addNeighbour:[_nodeList objectAtIndex:5]];
        [[_nodeList objectAtIndex:6] addNeighbour:[_nodeList objectAtIndex:7]];
        
        [[_nodeList objectAtIndex:7] addNeighbour:[_nodeList objectAtIndex:6]];
        [[_nodeList objectAtIndex:7] addNeighbour:[_nodeList objectAtIndex:8]];
        
        [[_nodeList objectAtIndex:8] addNeighbour:[_nodeList objectAtIndex:7]];
        [[_nodeList objectAtIndex:8] addNeighbour:[_nodeList objectAtIndex:9]];
        
        [[_nodeList objectAtIndex:9] addNeighbour:[_nodeList objectAtIndex:8]];
        [[_nodeList objectAtIndex:9] addNeighbour:[_nodeList objectAtIndex:10]];
        
        [[_nodeList objectAtIndex:10] addNeighbour:[_nodeList objectAtIndex:9]];
        [[_nodeList objectAtIndex:10] addNeighbour:[_nodeList objectAtIndex:11]];
        
        [[_nodeList objectAtIndex:11] addNeighbour:[_nodeList objectAtIndex:10]];
        [[_nodeList objectAtIndex:11] addNeighbour:[_nodeList objectAtIndex:12]];
        
        [[_nodeList objectAtIndex:12] addNeighbour:[_nodeList objectAtIndex:11]];
        [[_nodeList objectAtIndex:12] addNeighbour:[_nodeList objectAtIndex:13]];
        
        [[_nodeList objectAtIndex:13] addNeighbour:[_nodeList objectAtIndex:12]];
        [[_nodeList objectAtIndex:13] addNeighbour:[_nodeList objectAtIndex:14]];
        
        [[_nodeList objectAtIndex:14] addNeighbour:[_nodeList objectAtIndex:13]];
        [[_nodeList objectAtIndex:14] addNeighbour:[_nodeList objectAtIndex:15]];
        
        [[_nodeList objectAtIndex:15] addNeighbour:[_nodeList objectAtIndex:14]];
        [[_nodeList objectAtIndex:15] addNeighbour:[_nodeList objectAtIndex:16]];
        
        [[_nodeList objectAtIndex:16] addNeighbour:[_nodeList objectAtIndex:15]];
        [[_nodeList objectAtIndex:16] addNeighbour:[_nodeList objectAtIndex:17]];
        
        [[_nodeList objectAtIndex:17] addNeighbour:[_nodeList objectAtIndex:16]];
        [[_nodeList objectAtIndex:17] addNeighbour:[_nodeList objectAtIndex:18]];
        
        [[_nodeList objectAtIndex:18] addNeighbour:[_nodeList objectAtIndex:17]];
        [[_nodeList objectAtIndex:18] addNeighbour:[_nodeList objectAtIndex:19]];
        
        [[_nodeList objectAtIndex:19] addNeighbour:[_nodeList objectAtIndex:18]];
        [[_nodeList objectAtIndex:19] addNeighbour:[_nodeList objectAtIndex:20]];
        
        [[_nodeList objectAtIndex:20] addNeighbour:[_nodeList objectAtIndex:19]];
        [[_nodeList objectAtIndex:20] addNeighbour:[_nodeList objectAtIndex:21]];
        
        [[_nodeList objectAtIndex:21] addNeighbour:[_nodeList objectAtIndex:20]];
        [[_nodeList objectAtIndex:21] addNeighbour:[_nodeList objectAtIndex:22]];
        
        [[_nodeList objectAtIndex:22] addNeighbour:[_nodeList objectAtIndex:21]];
        [[_nodeList objectAtIndex:22] addNeighbour:[_nodeList objectAtIndex:23]];
        
        [[_nodeList objectAtIndex:23] addNeighbour:[_nodeList objectAtIndex:22]];
        [[_nodeList objectAtIndex:23] addNeighbour:[_nodeList objectAtIndex:24]];
        
        [[_nodeList objectAtIndex:24] addNeighbour:[_nodeList objectAtIndex:23]];
        [[_nodeList objectAtIndex:24] addNeighbour:[_nodeList objectAtIndex:25]];
        
        [[_nodeList objectAtIndex:25] addNeighbour:[_nodeList objectAtIndex:24]];
        [[_nodeList objectAtIndex:25] addNeighbour:[_nodeList objectAtIndex:26]];
        
        [[_nodeList objectAtIndex:26] addNeighbour:[_nodeList objectAtIndex:25]];
        [[_nodeList objectAtIndex:26] addNeighbour:[_nodeList objectAtIndex:27]];
        [[_nodeList objectAtIndex:26] addNeighbour:[_nodeList objectAtIndex:42]];
        
        [[_nodeList objectAtIndex:27] addNeighbour:[_nodeList objectAtIndex:26]];
        [[_nodeList objectAtIndex:27] addNeighbour:[_nodeList objectAtIndex:28]];
        
        [[_nodeList objectAtIndex:28] addNeighbour:[_nodeList objectAtIndex:27]];
        [[_nodeList objectAtIndex:28] addNeighbour:[_nodeList objectAtIndex:29]];
        
        [[_nodeList objectAtIndex:29] addNeighbour:[_nodeList objectAtIndex:28]];
        [[_nodeList objectAtIndex:29] addNeighbour:[_nodeList objectAtIndex:30]];
        
        [[_nodeList objectAtIndex:30] addNeighbour:[_nodeList objectAtIndex:29]];
        [[_nodeList objectAtIndex:30] addNeighbour:[_nodeList objectAtIndex:31]];
        
        [[_nodeList objectAtIndex:31] addNeighbour:[_nodeList objectAtIndex:30]];
        [[_nodeList objectAtIndex:31] addNeighbour:[_nodeList objectAtIndex:32]];
        
        [[_nodeList objectAtIndex:32] addNeighbour:[_nodeList objectAtIndex:31]];
        [[_nodeList objectAtIndex:32] addNeighbour:[_nodeList objectAtIndex:33]];
        
        [[_nodeList objectAtIndex:33] addNeighbour:[_nodeList objectAtIndex:32]];
        [[_nodeList objectAtIndex:33] addNeighbour:[_nodeList objectAtIndex:34]];
        
        [[_nodeList objectAtIndex:34] addNeighbour:[_nodeList objectAtIndex:33]];
        [[_nodeList objectAtIndex:34] addNeighbour:[_nodeList objectAtIndex:35]];
        
        [[_nodeList objectAtIndex:35] addNeighbour:[_nodeList objectAtIndex:34]];
        [[_nodeList objectAtIndex:35] addNeighbour:[_nodeList objectAtIndex:36]];
        
        [[_nodeList objectAtIndex:36] addNeighbour:[_nodeList objectAtIndex:35]];
        [[_nodeList objectAtIndex:36] addNeighbour:[_nodeList objectAtIndex:37]];
        
        [[_nodeList objectAtIndex:37] addNeighbour:[_nodeList objectAtIndex:36]];
        [[_nodeList objectAtIndex:37] addNeighbour:[_nodeList objectAtIndex:38]];
        
        [[_nodeList objectAtIndex:38] addNeighbour:[_nodeList objectAtIndex:37]];
        [[_nodeList objectAtIndex:38] addNeighbour:[_nodeList objectAtIndex:39]];
        
        [[_nodeList objectAtIndex:39] addNeighbour:[_nodeList objectAtIndex:38]];
        [[_nodeList objectAtIndex:39] addNeighbour:[_nodeList objectAtIndex:40]];
        
        [[_nodeList objectAtIndex:40] addNeighbour:[_nodeList objectAtIndex:39]];
        [[_nodeList objectAtIndex:40] addNeighbour:[_nodeList objectAtIndex:41]];
        [[_nodeList objectAtIndex:40] addNeighbour:[_nodeList objectAtIndex:43]];
        
        [[_nodeList objectAtIndex:41] addNeighbour:[_nodeList objectAtIndex:40]];
        [[_nodeList objectAtIndex:41] addNeighbour:[_nodeList objectAtIndex:42]];
        
        [[_nodeList objectAtIndex:42] addNeighbour:[_nodeList objectAtIndex:41]];
        [[_nodeList objectAtIndex:42] addNeighbour:[_nodeList objectAtIndex:26]];
        
        [[_nodeList objectAtIndex:43] addNeighbour:[_nodeList objectAtIndex:40]];
        [[_nodeList objectAtIndex:43] addNeighbour:[_nodeList objectAtIndex:44]];
        
        [[_nodeList objectAtIndex:44] addNeighbour:[_nodeList objectAtIndex:43]];
        [[_nodeList objectAtIndex:44] addNeighbour:[_nodeList objectAtIndex:45]];
        
        [[_nodeList objectAtIndex:45] addNeighbour:[_nodeList objectAtIndex:44]];
        [[_nodeList objectAtIndex:45] addNeighbour:[_nodeList objectAtIndex:46]];
        
        [[_nodeList objectAtIndex:46] addNeighbour:[_nodeList objectAtIndex:45]];
        [[_nodeList objectAtIndex:46] addNeighbour:[_nodeList objectAtIndex:47]];
        
        [[_nodeList objectAtIndex:47] addNeighbour:[_nodeList objectAtIndex:46]];
        [[_nodeList objectAtIndex:47] addNeighbour:[_nodeList objectAtIndex:1]];
        
        [[_nodeList objectAtIndex:48] addNeighbour:[_nodeList objectAtIndex:43]];
        [[_nodeList objectAtIndex:43] addNeighbour:[_nodeList objectAtIndex:48]];
        
        [[_nodeList objectAtIndex:49] addNeighbour:[_nodeList objectAtIndex:44]];
        [[_nodeList objectAtIndex:44] addNeighbour:[_nodeList objectAtIndex:49]];
        
        [[_nodeList objectAtIndex:50] addNeighbour:[_nodeList objectAtIndex:39]];
        [[_nodeList objectAtIndex:39] addNeighbour:[_nodeList objectAtIndex:50]];
        
        [[_nodeList objectAtIndex:51] addNeighbour:[_nodeList objectAtIndex:38]];
        [[_nodeList objectAtIndex:38] addNeighbour:[_nodeList objectAtIndex:51]];
        
        [[_nodeList objectAtIndex:52] addNeighbour:[_nodeList objectAtIndex:45]];
        [[_nodeList objectAtIndex:45] addNeighbour:[_nodeList objectAtIndex:52]];
        
        [[_nodeList objectAtIndex:53] addNeighbour:[_nodeList objectAtIndex:45]];
        [[_nodeList objectAtIndex:45] addNeighbour:[_nodeList objectAtIndex:53]];
        
        [[_nodeList objectAtIndex:54] addNeighbour:[_nodeList objectAtIndex:46]];
        [[_nodeList objectAtIndex:46] addNeighbour:[_nodeList objectAtIndex:54]];
        
        [[_nodeList objectAtIndex:55] addNeighbour:[_nodeList objectAtIndex:46]];
        [[_nodeList objectAtIndex:46] addNeighbour:[_nodeList objectAtIndex:55]];
        
        [[_nodeList objectAtIndex:56] addNeighbour:[_nodeList objectAtIndex:47]];
        [[_nodeList objectAtIndex:47] addNeighbour:[_nodeList objectAtIndex:56]];
        
        [[_nodeList objectAtIndex:57] addNeighbour:[_nodeList objectAtIndex:1]];
        [[_nodeList objectAtIndex:1] addNeighbour:[_nodeList objectAtIndex:57]];
        
        [[_nodeList objectAtIndex:58] addNeighbour:[_nodeList objectAtIndex:4]];
        [[_nodeList objectAtIndex:4] addNeighbour:[_nodeList objectAtIndex:58]];
        
        [[_nodeList objectAtIndex:59] addNeighbour:[_nodeList objectAtIndex:2]];
        [[_nodeList objectAtIndex:2] addNeighbour:[_nodeList objectAtIndex:59]];
        
        [[_nodeList objectAtIndex:60] addNeighbour:[_nodeList objectAtIndex:3]];
        [[_nodeList objectAtIndex:3] addNeighbour:[_nodeList objectAtIndex:60]];
        
        [[_nodeList objectAtIndex:61] addNeighbour:[_nodeList objectAtIndex:4]];
        [[_nodeList objectAtIndex:4] addNeighbour:[_nodeList objectAtIndex:61]];
        
        [[_nodeList objectAtIndex:62] addNeighbour:[_nodeList objectAtIndex:5]];
        [[_nodeList objectAtIndex:5] addNeighbour:[_nodeList objectAtIndex:62]];
        
        [[_nodeList objectAtIndex:63] addNeighbour:[_nodeList objectAtIndex:6]];
        [[_nodeList objectAtIndex:6] addNeighbour:[_nodeList objectAtIndex:63]];
        
        [[_nodeList objectAtIndex:64] addNeighbour:[_nodeList objectAtIndex:7]];
        [[_nodeList objectAtIndex:7] addNeighbour:[_nodeList objectAtIndex:64]];
        
        [[_nodeList objectAtIndex:65] addNeighbour:[_nodeList objectAtIndex:8]];
        [[_nodeList objectAtIndex:8] addNeighbour:[_nodeList objectAtIndex:65]];
        
        [[_nodeList objectAtIndex:66] addNeighbour:[_nodeList objectAtIndex:9]];
        [[_nodeList objectAtIndex:9] addNeighbour:[_nodeList objectAtIndex:66]];
        
        [[_nodeList objectAtIndex:67] addNeighbour:[_nodeList objectAtIndex:9]];
        [[_nodeList objectAtIndex:9] addNeighbour:[_nodeList objectAtIndex:67]];
        
        [[_nodeList objectAtIndex:68] addNeighbour:[_nodeList objectAtIndex:10]];
        [[_nodeList objectAtIndex:10] addNeighbour:[_nodeList objectAtIndex:68]];
        
        [[_nodeList objectAtIndex:69] addNeighbour:[_nodeList objectAtIndex:11]];
        [[_nodeList objectAtIndex:11] addNeighbour:[_nodeList objectAtIndex:69]];
        
        [[_nodeList objectAtIndex:70] addNeighbour:[_nodeList objectAtIndex:12]];
        [[_nodeList objectAtIndex:12] addNeighbour:[_nodeList objectAtIndex:70]];
        
        [[_nodeList objectAtIndex:71] addNeighbour:[_nodeList objectAtIndex:13]];
        [[_nodeList objectAtIndex:13] addNeighbour:[_nodeList objectAtIndex:71]];
        
        [[_nodeList objectAtIndex:72] addNeighbour:[_nodeList objectAtIndex:14]];
        [[_nodeList objectAtIndex:14] addNeighbour:[_nodeList objectAtIndex:72]];
        
        [[_nodeList objectAtIndex:73] addNeighbour:[_nodeList objectAtIndex:15]];
        [[_nodeList objectAtIndex:15] addNeighbour:[_nodeList objectAtIndex:73]];
        
        [[_nodeList objectAtIndex:74] addNeighbour:[_nodeList objectAtIndex:16]];
        [[_nodeList objectAtIndex:16] addNeighbour:[_nodeList objectAtIndex:74]];
        
        [[_nodeList objectAtIndex:75] addNeighbour:[_nodeList objectAtIndex:17]];
        [[_nodeList objectAtIndex:17] addNeighbour:[_nodeList objectAtIndex:75]];
        
        [[_nodeList objectAtIndex:76] addNeighbour:[_nodeList objectAtIndex:18]];
        [[_nodeList objectAtIndex:18] addNeighbour:[_nodeList objectAtIndex:76]];
        
        [[_nodeList objectAtIndex:77] addNeighbour:[_nodeList objectAtIndex:19]];
        [[_nodeList objectAtIndex:19] addNeighbour:[_nodeList objectAtIndex:77]];
        
        [[_nodeList objectAtIndex:78] addNeighbour:[_nodeList objectAtIndex:20]];
        [[_nodeList objectAtIndex:20] addNeighbour:[_nodeList objectAtIndex:78]];
        
        [[_nodeList objectAtIndex:79] addNeighbour:[_nodeList objectAtIndex:21]];
        [[_nodeList objectAtIndex:21] addNeighbour:[_nodeList objectAtIndex:79]];
        
        [[_nodeList objectAtIndex:80] addNeighbour:[_nodeList objectAtIndex:22]];
        [[_nodeList objectAtIndex:22] addNeighbour:[_nodeList objectAtIndex:80]];
        
        [[_nodeList objectAtIndex:81] addNeighbour:[_nodeList objectAtIndex:23]];
        [[_nodeList objectAtIndex:23] addNeighbour:[_nodeList objectAtIndex:81]];
        
        [[_nodeList objectAtIndex:82] addNeighbour:[_nodeList objectAtIndex:22]];
        [[_nodeList objectAtIndex:22] addNeighbour:[_nodeList objectAtIndex:82]];
        
        [[_nodeList objectAtIndex:83] addNeighbour:[_nodeList objectAtIndex:24]];
        [[_nodeList objectAtIndex:24] addNeighbour:[_nodeList objectAtIndex:83]];
        
        [[_nodeList objectAtIndex:84] addNeighbour:[_nodeList objectAtIndex:41]];
        [[_nodeList objectAtIndex:41] addNeighbour:[_nodeList objectAtIndex:84]];
        
        [[_nodeList objectAtIndex:85] addNeighbour:[_nodeList objectAtIndex:25]];
        [[_nodeList objectAtIndex:25] addNeighbour:[_nodeList objectAtIndex:85]];
        
        [[_nodeList objectAtIndex:86] addNeighbour:[_nodeList objectAtIndex:42]];
        [[_nodeList objectAtIndex:42] addNeighbour:[_nodeList objectAtIndex:86]];
        
        [[_nodeList objectAtIndex:87] addNeighbour:[_nodeList objectAtIndex:26]];
        [[_nodeList objectAtIndex:26] addNeighbour:[_nodeList objectAtIndex:87]];
        
        [[_nodeList objectAtIndex:88] addNeighbour:[_nodeList objectAtIndex:29]];
        [[_nodeList objectAtIndex:29] addNeighbour:[_nodeList objectAtIndex:88]];
        
        [[_nodeList objectAtIndex:89] addNeighbour:[_nodeList objectAtIndex:27]];
        [[_nodeList objectAtIndex:27] addNeighbour:[_nodeList objectAtIndex:89]];
        
        [[_nodeList objectAtIndex:90] addNeighbour:[_nodeList objectAtIndex:28]];
        [[_nodeList objectAtIndex:28] addNeighbour:[_nodeList objectAtIndex:90]];
        
        [[_nodeList objectAtIndex:91] addNeighbour:[_nodeList objectAtIndex:29]];
        [[_nodeList objectAtIndex:29] addNeighbour:[_nodeList objectAtIndex:91]];
        
        [[_nodeList objectAtIndex:92] addNeighbour:[_nodeList objectAtIndex:30]];
        [[_nodeList objectAtIndex:30] addNeighbour:[_nodeList objectAtIndex:92]];
        
        [[_nodeList objectAtIndex:93] addNeighbour:[_nodeList objectAtIndex:31]];
        [[_nodeList objectAtIndex:31] addNeighbour:[_nodeList objectAtIndex:93]];
        
        [[_nodeList objectAtIndex:94] addNeighbour:[_nodeList objectAtIndex:32]];
        [[_nodeList objectAtIndex:32] addNeighbour:[_nodeList objectAtIndex:94]];
        
        [[_nodeList objectAtIndex:95] addNeighbour:[_nodeList objectAtIndex:33]];
        [[_nodeList objectAtIndex:33] addNeighbour:[_nodeList objectAtIndex:95]];
        
        [[_nodeList objectAtIndex:96] addNeighbour:[_nodeList objectAtIndex:34]];
        [[_nodeList objectAtIndex:34] addNeighbour:[_nodeList objectAtIndex:96]];
        
        [[_nodeList objectAtIndex:97] addNeighbour:[_nodeList objectAtIndex:35]];
        [[_nodeList objectAtIndex:35] addNeighbour:[_nodeList objectAtIndex:97]];
        
        [[_nodeList objectAtIndex:98] addNeighbour:[_nodeList objectAtIndex:36]];
        [[_nodeList objectAtIndex:36] addNeighbour:[_nodeList objectAtIndex:98]];
        
        [[_nodeList objectAtIndex:99] addNeighbour:[_nodeList objectAtIndex:36]];
        [[_nodeList objectAtIndex:36] addNeighbour:[_nodeList objectAtIndex:99]];

        [[_nodeList objectAtIndex:100] addNeighbour:[_nodeList objectAtIndex:37]];
        [[_nodeList objectAtIndex:37] addNeighbour:[_nodeList objectAtIndex:100]];
        
        [[_nodeList objectAtIndex:101] addNeighbour:[_nodeList objectAtIndex:37]];
        [[_nodeList objectAtIndex:37] addNeighbour:[_nodeList objectAtIndex:101]];
        
        
// 102
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.08008
                                                          Longitude:-114.128144
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0744.back.jpg"
                                                         RightImage:@"IMG_0744.left.jpg"
                                                          BackImage:@"IMG_0744.front.jpg"
                                                          LeftImage:@"IMG_0744.right.jpg"]];
// 103
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.080099
                                                          Longitude:-114.127903
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0742.back.jpg"
                                                         RightImage:@"IMG_0742.left.jpg"
                                                          BackImage:@"IMG_0742.front.jpg"
                                                          LeftImage:@"IMG_0742.right.jpg"]];
// 104
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.080099
                                                          Longitude:-114.127485
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0750.back.jpg"
                                                         RightImage:@"IMG_0750.left.jpg"
                                                          BackImage:@"IMG_0750.front.jpg"
                                                          LeftImage:@"IMG_0750.right.jpg"]];
// 105
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.080026
                                                          Longitude:-114.127447
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0740.back.jpg"
                                                         RightImage:@"IMG_0740.left.jpg"
                                                          BackImage:@"IMG_0740.front.jpg"
                                                          LeftImage:@"IMG_0740.right.jpg"]];
// 106
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.080026
                                                          Longitude:-114.127485
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:1]
                                                         FrontImage:@"IMG_0738.back.jpg"
                                                         RightImage:@"IMG_0738.left.jpg"
                                                          BackImage:@"IMG_0738.front.jpg"
                                                          LeftImage:@"IMG_0738.right.jpg"]];
// 107
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079823
                                                          Longitude:-114.127485
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"IMG_0730.back.jpg"
                                                         RightImage:@"IMG_0730.left.jpg"
                                                          BackImage:@"IMG_0730.front.jpg"
                                                          LeftImage:@"IMG_0730.right.jpg"]];
// 108
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079779
                                                          Longitude:-114.12771
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"IMG_0728.back.jpg"
                                                         RightImage:@"IMG_0728.left.jpg"
                                                          BackImage:@"IMG_0728.front.jpg"
                                                          LeftImage:@"IMG_0728.right.jpg"]];
// 109
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079728
                                                          Longitude:-114.12771
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 110
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079728
                                                          Longitude:-114.127694
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 111
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079614
                                                          Longitude:-114.127635
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"IMG_0726.back.jpg"
                                                         RightImage:@"IMG_0726.left.jpg"
                                                          BackImage:@"IMG_0726.front.jpg"
                                                          LeftImage:@"IMG_0726.right.jpg"]];
// 112
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079583
                                                          Longitude:-114.127592
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 113
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079438
                                                          Longitude:-114.127485
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 114
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079391
                                                          Longitude:-114.127426
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 115
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079512
                                                          Longitude:-114.127018
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 116
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.07961
                                                          Longitude:-114.127034
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 117
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.07961
                                                          Longitude:-114.127034
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 118
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.079614
                                                          Longitude:-114.127635
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 119
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.079728
                                                          Longitude:-114.128262
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 120
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"hallway"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 121
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"movement"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"hall"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 122
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079438
                                                          Longitude:-114.127592
                                                               Name:@"ST 125"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 123
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079438
                                                          Longitude:-114.127469
                                                               Name:@"ST 126"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 124
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079583
                                                          Longitude:-114.127635
                                                               Name:@"ST 127"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 125
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                            Lattitude:51.079583
                                                          Longitude:-114.127469
                                                               Name:@"ST 128"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 126
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079614
                                                          Longitude:-114.127694
                                                               Name:@"ST 129"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 127
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079728
                                                          Longitude:-114.127485
                                                               Name:@"ST 130"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 128
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079728
                                                          Longitude:-114.127812
                                                               Name:@"ST 131"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 129
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079728
                                                          Longitude:-114.127673
                                                               Name:@"ST 132"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 130
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079728
                                                          Longitude:-114.127812
                                                               Name:@"ST 133"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 131
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.079779
                                                          Longitude:-114.127812
                                                               Name:@"ST 135"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 132
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"ST 140"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 133
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"ST 141"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 134
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"ST 142"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 135
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"ST 143"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 136
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"ST 145"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 137
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"ST 147"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
// 138
        [_nodeList addObject:[[ICM_Node alloc] initWithValuesInside:YES
                                                               Type:@"room"
                                                             Ground:YES
                                                          Lattitude:51.080081
                                                          Longitude:-114.128262
                                                               Name:@"ST 148"
                                                           Building:[_buildingList objectAtIndex:2]
                                                         FrontImage:@"none"
                                                         RightImage:@"none"
                                                          BackImage:@"none"
                                                          LeftImage:@"none"]];
        
        [[_nodeList objectAtIndex:102] addNeighbour:[_nodeList objectAtIndex:48]];
        [[_nodeList objectAtIndex:48] addNeighbour:[_nodeList objectAtIndex:102]];
        [[_nodeList objectAtIndex:102] addNeighbour:[_nodeList objectAtIndex:49]];
        [[_nodeList objectAtIndex:49] addNeighbour:[_nodeList objectAtIndex:102]];
        [[_nodeList objectAtIndex:102] addNeighbour:[_nodeList objectAtIndex:103]];
        
        [[_nodeList objectAtIndex:103] addNeighbour:[_nodeList objectAtIndex:102]];
        [[_nodeList objectAtIndex:102] addNeighbour:[_nodeList objectAtIndex:103]];
        
        [[_nodeList objectAtIndex:103] addNeighbour:[_nodeList objectAtIndex:104]];
        [[_nodeList objectAtIndex:104] addNeighbour:[_nodeList objectAtIndex:103]];
        
        [[_nodeList objectAtIndex:104] addNeighbour:[_nodeList objectAtIndex:106]];
        [[_nodeList objectAtIndex:106] addNeighbour:[_nodeList objectAtIndex:104]];
        
        [[_nodeList objectAtIndex:105] addNeighbour:[_nodeList objectAtIndex:106]];
        [[_nodeList objectAtIndex:106] addNeighbour:[_nodeList objectAtIndex:105]];
        
        [[_nodeList objectAtIndex:106] addNeighbour:[_nodeList objectAtIndex:107]];
        [[_nodeList objectAtIndex:107] addNeighbour:[_nodeList objectAtIndex:106]];
        
        [[_nodeList objectAtIndex:107] addNeighbour:[_nodeList objectAtIndex:108]];
        [[_nodeList objectAtIndex:108] addNeighbour:[_nodeList objectAtIndex:107]];
        
        [[_nodeList objectAtIndex:108] addNeighbour:[_nodeList objectAtIndex:109]];
        [[_nodeList objectAtIndex:109] addNeighbour:[_nodeList objectAtIndex:108]];
        
        [[_nodeList objectAtIndex:109] addNeighbour:[_nodeList objectAtIndex:110]];
        [[_nodeList objectAtIndex:110] addNeighbour:[_nodeList objectAtIndex:109]];
        
        [[_nodeList objectAtIndex:110] addNeighbour:[_nodeList objectAtIndex:111]];
        [[_nodeList objectAtIndex:111] addNeighbour:[_nodeList objectAtIndex:110]];
        
        [[_nodeList objectAtIndex:111] addNeighbour:[_nodeList objectAtIndex:112]];
        [[_nodeList objectAtIndex:112] addNeighbour:[_nodeList objectAtIndex:111]];
        
        [[_nodeList objectAtIndex:112] addNeighbour:[_nodeList objectAtIndex:113]];
        [[_nodeList objectAtIndex:113] addNeighbour:[_nodeList objectAtIndex:112]];
        
//        [[_nodeList objectAtIndex:113] addNeighbour:[_nodeList objectAtIndex:114]];
//        [[_nodeList objectAtIndex:114] addNeighbour:[_nodeList objectAtIndex:113]];
//        
//        [[_nodeList objectAtIndex:114] addNeighbour:[_nodeList objectAtIndex:115]];
//        [[_nodeList objectAtIndex:115] addNeighbour:[_nodeList objectAtIndex:114]];
//        
//        [[_nodeList objectAtIndex:115] addNeighbour:[_nodeList objectAtIndex:116]];
//        [[_nodeList objectAtIndex:116] addNeighbour:[_nodeList objectAtIndex:115]];
//        
//        [[_nodeList objectAtIndex:116] addNeighbour:[_nodeList objectAtIndex:117]];
//        [[_nodeList objectAtIndex:117] addNeighbour:[_nodeList objectAtIndex:116]];
//        
//        [[_nodeList objectAtIndex:117] addNeighbour:[_nodeList objectAtIndex:118]];
//        [[_nodeList objectAtIndex:118] addNeighbour:[_nodeList objectAtIndex:117]];
//        
//        [[_nodeList objectAtIndex:118] addNeighbour:[_nodeList objectAtIndex:119]];
//        [[_nodeList objectAtIndex:119] addNeighbour:[_nodeList objectAtIndex:118]];
//        
//        [[_nodeList objectAtIndex:119] addNeighbour:[_nodeList objectAtIndex:120]];
//        [[_nodeList objectAtIndex:120] addNeighbour:[_nodeList objectAtIndex:119]];
//        
//        [[_nodeList objectAtIndex:120] addNeighbour:[_nodeList objectAtIndex:121]];
//        [[_nodeList objectAtIndex:121] addNeighbour:[_nodeList objectAtIndex:120]];
//        
//        [[_nodeList objectAtIndex:121] addNeighbour:[_nodeList objectAtIndex:107]];
//        [[_nodeList objectAtIndex:107] addNeighbour:[_nodeList objectAtIndex:121]];
        
        [[_nodeList objectAtIndex:122] addNeighbour:[_nodeList objectAtIndex:113]];
        [[_nodeList objectAtIndex:113] addNeighbour:[_nodeList objectAtIndex:122]];
        
        [[_nodeList objectAtIndex:123] addNeighbour:[_nodeList objectAtIndex:113]];
        [[_nodeList objectAtIndex:113] addNeighbour:[_nodeList objectAtIndex:123]];
        
        [[_nodeList objectAtIndex:124] addNeighbour:[_nodeList objectAtIndex:112]];
        [[_nodeList objectAtIndex:112] addNeighbour:[_nodeList objectAtIndex:124]];
        
        [[_nodeList objectAtIndex:125] addNeighbour:[_nodeList objectAtIndex:112]];
        [[_nodeList objectAtIndex:112] addNeighbour:[_nodeList objectAtIndex:125]];
        
        [[_nodeList objectAtIndex:126] addNeighbour:[_nodeList objectAtIndex:111]];
        [[_nodeList objectAtIndex:111] addNeighbour:[_nodeList objectAtIndex:126]];
        
        [[_nodeList objectAtIndex:127] addNeighbour:[_nodeList objectAtIndex:111]];
        [[_nodeList objectAtIndex:111] addNeighbour:[_nodeList objectAtIndex:127]];
        
        [[_nodeList objectAtIndex:128] addNeighbour:[_nodeList objectAtIndex:110]];
        [[_nodeList objectAtIndex:110] addNeighbour:[_nodeList objectAtIndex:128]];
        
        [[_nodeList objectAtIndex:129] addNeighbour:[_nodeList objectAtIndex:110]];
        [[_nodeList objectAtIndex:110] addNeighbour:[_nodeList objectAtIndex:129]];
        
        [[_nodeList objectAtIndex:130] addNeighbour:[_nodeList objectAtIndex:109]];
        [[_nodeList objectAtIndex:109] addNeighbour:[_nodeList objectAtIndex:130]];
        
        [[_nodeList objectAtIndex:131] addNeighbour:[_nodeList objectAtIndex:108]];
        [[_nodeList objectAtIndex:108] addNeighbour:[_nodeList objectAtIndex:131]];
        
//        [[_nodeList objectAtIndex:132] addNeighbour:[_nodeList objectAtIndex:120]];
//        [[_nodeList objectAtIndex:120] addNeighbour:[_nodeList objectAtIndex:132]];
//        
//        [[_nodeList objectAtIndex:133] addNeighbour:[_nodeList objectAtIndex:120]];
//        [[_nodeList objectAtIndex:120] addNeighbour:[_nodeList objectAtIndex:133]];
//        
//        [[_nodeList objectAtIndex:134] addNeighbour:[_nodeList objectAtIndex:118]];
//        [[_nodeList objectAtIndex:118] addNeighbour:[_nodeList objectAtIndex:134]];
//        
//        [[_nodeList objectAtIndex:135] addNeighbour:[_nodeList objectAtIndex:119]];
//        [[_nodeList objectAtIndex:119] addNeighbour:[_nodeList objectAtIndex:135]];
//        
//        [[_nodeList objectAtIndex:136] addNeighbour:[_nodeList objectAtIndex:117]];
//        [[_nodeList objectAtIndex:117] addNeighbour:[_nodeList objectAtIndex:136]];
//        
//        [[_nodeList objectAtIndex:137] addNeighbour:[_nodeList objectAtIndex:116]];
//        [[_nodeList objectAtIndex:116] addNeighbour:[_nodeList objectAtIndex:137]];
//        
//        [[_nodeList objectAtIndex:138] addNeighbour:[_nodeList objectAtIndex:116]];
//        [[_nodeList objectAtIndex:116] addNeighbour:[_nodeList objectAtIndex:138]];
        
        
        _adjacancyMatrix = [[NSMutableArray alloc] initWithCapacity:[_nodeList count]];
        
        // creates the 2d adjacanecy matrix
        for (int i = 0; i < [_nodeList count]; i++)
        {
            [_adjacancyMatrix addObject:[[NSMutableArray alloc] initWithCapacity:[_nodeList count]]];
        }
        
        // sets every point in the adj matrix to -1 (-1 = no connection)
        for (int x = 0; x < [_nodeList count]; x++)
        {
            for (int y = 0; y < [_nodeList count]; y++)
            {
                [[_adjacancyMatrix objectAtIndex:x] insertObject:[NSNumber numberWithInt:99999] atIndex:y];
            }
        }
        
        // reads from neighboursAndWeights for each node and then updates the adj matrix accordingly
        for (int x = 0; x < [_nodeList count]; x++)
        {
            for (int y = 0; y < [_nodeList count]; y++)
            {
                if (x != y)
                {
                    for (int z = 0; z < [[[_nodeList objectAtIndex:y] neighboursAndWeights] count]; z++)
                    {
                        ICM_Node *node1 = [[[[_nodeList objectAtIndex:y] neighboursAndWeights] objectAtIndex:z] objectAtIndex:0];
                        ICM_Node *node2 = [_nodeList objectAtIndex:x];
                        if ([node1 isEqual:node2])
                        //if ([tempName1 isEqualToString:tempName2])
                        {
                            NSNumber *tempDistance = [[[[_nodeList objectAtIndex:y] neighboursAndWeights] objectAtIndex:z] objectAtIndex:1];
                            [[_adjacancyMatrix objectAtIndex:x] insertObject:tempDistance atIndex:y];
                        }
                    }
                }
            }
        }
        
    }
    return self;
}

- (void)addStartNode:(ICM_Node*)nodel;
{
    _startNode = [[ICM_Node alloc] init];
    _startNode = nodel;
}

// singleton function
+ (id)sharedModel {
    static ICM_Model *singleModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleModel = [[self alloc] init];
    });
    return singleModel;
}

// very crappy dijsktra's implementation, VERY INEFFICIENT
- (NSArray*)dijsktra:(ICM_Node*)startNode EndNode:(ICM_Node*)endNode;
{
    int n = [_nodeList count];
    double distance[n];
    double precede[n];
    int source;
    int destination;
    BOOL visit[n];
    for (int i = 0; i < [_nodeList count]; i++)
    {
        if ([[_nodeList objectAtIndex:i] isEqual:startNode])
            source = i;
        if ([[_nodeList objectAtIndex:i] isEqual:endNode])
            destination = i;
    }
    for (int i = 0; i < n; i++)
    {
        distance[i] = 99999;
        precede[i] = 99999;
        visit[i] = FALSE;
    }
    distance[source] = 0;
    int current = source;
    while (current != destination)
    {
        double distcurr = distance[current];
        double smalldist = 99999;
        int k = -1;
        visit[current] = true;
        for (int i = 0; i < n; i++)
        {
            if (!visit[i])
            {
                double newdist = distcurr + [[[_adjacancyMatrix objectAtIndex:current] objectAtIndex:i] integerValue];
                if (newdist < distance[i])
                {
                    distance[i] = newdist;
                    precede[i] = current;
                }
                if (distance[i] < smalldist)
                {
                    smalldist = distance[i];
                    k = i;
                }
            }

        }
        current = k;
    }
    int i = destination;
    int finall = 0;
    int path[n];
    path[finall] = destination;
    finall++;
    while (precede[i] != source)
    {
        i = precede[i];
        path[finall] = i;
        finall++;
    }
    path[finall] = source;
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:(finall+1)];
    int temp = finall;
    for (int x = 0; x < finall+1; x++)
    {
        [result insertObject:[_nodeList objectAtIndex:(path[temp])] atIndex:x];
        temp--;
    }
    return result;
}

- (NSArray*)pruneResults;
{
    NSMutableArray *pruning = [[NSMutableArray alloc] init];
    [pruning addObject:[_shortestPath objectAtIndex:0]];
    for (int i = 1; i < [_shortestPath count]-1; i++)
    {
        if (!([[[_shortestPath objectAtIndex:i] frontName] isEqualToString:@"none"]))
        {
            [pruning addObject:[_shortestPath objectAtIndex:i]];
        }
    }
    [pruning addObject:[_shortestPath objectAtIndex:[_shortestPath count]-2]];
    [pruning addObject:[_shortestPath objectAtIndex:[_shortestPath count]-1]];
    NSArray *pruned = [[NSArray alloc] initWithArray:pruning];
    return pruned;
}

// calculates the bearing between two points
- (float)getBearingFrom:(CLLocationCoordinate2D)from To:(CLLocationCoordinate2D)to;
{
    float fLat = degreesToRadians(from.latitude);
    float fLng = degreesToRadians(from.longitude);
    float tLat = degreesToRadians(to.latitude);
    float tLng = degreesToRadians(to.longitude);
    
    float degree = radiandsToDegrees(atan2(sin(tLng-fLng)*cos(tLat), cos(fLat)*sin(tLat)-sin(fLat)*cos(tLat)*cos(tLng-fLng)));
    if (degree >= 0) {
        return degree;
    } else {
        return 360+degree;
    }
}

@end
