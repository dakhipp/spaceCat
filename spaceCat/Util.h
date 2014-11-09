//
//  Util.h
//  spaceCat
//
//  Created by dakota hipp on 7/4/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int ConstProjectileSpeed = 100;
static const int SpaceDogMinSpeed = -100;
static const int SpaceDogMaxSpeed = -50;
static const int ConstMaxLives = 4;
static const int ConstPointsPerHit = 100;

typedef NS_OPTIONS(uint32_t, CollisionCategory) {
    CollisionCategoryEnemy          = 1 << 0, //0000
    CollisionCategoryProjectile     = 1 << 1, //0010
    CollisionCategoryDebris         = 1 << 2, //0100
    CollisionCategoryGround         = 1 << 3  //1000
};

@interface Util : NSObject

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max;

@end
