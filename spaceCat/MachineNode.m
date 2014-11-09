//
//  MachineNode.m
//  spaceCat
//
//  Created by dakota hipp on 7/4/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import "MachineNode.h"

@implementation MachineNode

+(instancetype)machineAtPosition:(CGPoint)position{
    MachineNode *machine = [self spriteNodeWithImageNamed:@"machine_1"];
    machine.position = position;
    machine.name = @"Machine";
    machine.anchorPoint = CGPointMake(.5, 0);
    machine.zPosition = 8;
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],
                         [SKTexture textureWithImageNamed:@"machine_2"]];
    
    SKAction *machineAnimation = [SKAction animateWithTextures: textures timePerFrame:0.1];
    
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    [machine runAction:machineRepeat];
    
    return machine;
}

@end
