//
//  GameOverNode.h
//  spaceCat
//
//  Created by dakota hipp on 7/6/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameOverNode : SKNode

+(instancetype)gameOverAtPosition:(CGPoint)position;
-(void) performAnimation;

@end
