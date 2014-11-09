//
//  SpaceDogNode.h
//  spaceCat
//
//  Created by dakota hipp on 7/4/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSUInteger, SpaceDogType){
    SpaceDogTypeA = 0,
    SpaceDogTypeB = 1
};

@interface SpaceDogNode : SKSpriteNode

@property (nonatomic, getter = isDamaged) BOOL damaged;
@property (nonatomic) SpaceDogType type;

+(instancetype) spaceDogOfType:(SpaceDogType)type;

@end
