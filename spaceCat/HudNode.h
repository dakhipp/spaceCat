//
//  HudNode.h
//  spaceCat
//
//  Created by dakota hipp on 7/5/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HudNode : SKNode

@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger score;

+(instancetype)hudAtPosition:(CGPoint)position inFrame:(CGRect)frame;

-(void) addPoints:(NSInteger)points;
-(BOOL) loseLife;

@end
