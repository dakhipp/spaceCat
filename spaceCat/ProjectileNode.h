//
//  ProjectileNode.h
//  spaceCat
//
//  Created by dakota hipp on 7/4/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ProjectileNode : SKSpriteNode

+(instancetype) projectileAtPosition: (CGPoint)position;
-(void) moveTowardsPosition:(CGPoint)position;


@end
