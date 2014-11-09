//
//  SpaceCatNode.h
//  spaceCat
//
//  Created by dakota hipp on 7/4/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpaceCatNode : SKSpriteNode

+(instancetype) spaceCatAtPosition: (CGPoint)position;

- (void) performTap;

@end
