//
//  ProjectileNode.m
//  spaceCat
//
//  Created by dakota hipp on 7/4/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import "ProjectileNode.h"
#import "Util.h"

@implementation ProjectileNode

+(instancetype) projectileAtPosition: (CGPoint)position{
    ProjectileNode *projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    projectile.name = @"projectile";
    
    [projectile setUpAnimation];
    
    [projectile setUpPysicsBody];
    
    return projectile;
}

- (void) setUpPysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = CollisionCategoryProjectile;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryEnemy;
}

- (void) setUpAnimation {

    NSArray *textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
                          [SKTexture textureWithImageNamed:@"projectile_2"],
                          [SKTexture textureWithImageNamed:@"projectile_3"]];
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *repeatAction = [SKAction repeatActionForever:animation];
    [self runAction:repeatAction];
    
}

- (void) moveTowardsPosition:(CGPoint)position{
    //slope = (y3 - y1) / (x3 - x1)
    float slope = (position.y - self.position.y) / (position.x - self.position.x);
    
    // slope = (y2 - y1) / (x2 - x1)
    // y2 - y1 = slope (x2 - x1)
    // y2 = slope * x2 - slope * x1 + y1
    
    float offscreenX;
    
    if (position.x <= self.position.x) {
        offscreenX = - 10;
    } else {
        offscreenX = self.parent.frame.size.width + 10;
    }
    
    float offscreenY = slope * offscreenX - slope * self.position.x + self.position.y;
    
    CGPoint pointOffscreen = CGPointMake(offscreenX, offscreenY);
    
    float distanceA = pointOffscreen.y - self.position.y;
    float distanceB = pointOffscreen.x - self.position.x;
    
    float distanceC = sqrtf(powf(distanceA,2) + powf(distanceB,2));
                                                      
    float time = distanceC / ConstProjectileSpeed;
    float waitToFade = time * 0.75;
    float fadeTime = time - waitToFade;
    
    SKAction *moveProjectile = [SKAction moveTo:pointOffscreen duration:time];
    [self runAction:moveProjectile];
    
    NSArray *actions = @[[SKAction waitForDuration:waitToFade],
                         [SKAction fadeOutWithDuration:fadeTime],
                         [SKAction removeFromParent]];
    
    [self runAction:[SKAction sequence:actions]];

}

@end
