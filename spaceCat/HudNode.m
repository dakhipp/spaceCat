//
//  HudNode.m
//  spaceCat
//
//  Created by dakota hipp on 7/5/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import "HudNode.h"
#import "Util.h"

@implementation HudNode

+(instancetype)hudAtPosition:(CGPoint)position inFrame:(CGRect)frame{
    HudNode *hud = [self node];
    hud.position = position;
    hud.zPosition = 10;
    hud.Name = @"HUD";
    
    SKSpriteNode *catHead = [SKSpriteNode spriteNodeWithImageNamed:@"HUD_cat_1"];
    catHead.position = CGPointMake(30, -10);
    [hud addChild:catHead];
    
    hud.lives = ConstMaxLives;
    
    SKSpriteNode *lastLifeBar;
    
    for (int i = 0; i < hud.lives; i++) {
        SKSpriteNode *lifeBar = [SKSpriteNode spriteNodeWithImageNamed:@"HUD_life_1"];
        lifeBar.name = [NSString stringWithFormat:@"Life%d", i+1];
        
        [hud addChild:lifeBar];
        
        if (lastLifeBar == nil) {
            lifeBar.position = CGPointMake(catHead.position.x+30, catHead.position.y);
        } else {
            lifeBar.position = CGPointMake(lastLifeBar.position.x+10, catHead.position.y);
        }
        
        lastLifeBar = lifeBar;
    }
    
    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    scoreLabel.name = @"Score";
    scoreLabel.text = @"0";
    scoreLabel.fontSize = 24;
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    scoreLabel.position = CGPointMake(frame.size.width-20, catHead.position.y);
    [hud addChild:scoreLabel];
    
    return hud;
}

-(void) addPoints:(NSInteger)points{
    self.score += points;
    
    SKLabelNode *scoreLabel = (SKLabelNode*)[self childNodeWithName:@"Score"];
    scoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
}

-(BOOL) loseLife{
    if(self.lives > 0){
        NSString *lifeNodeName = [NSString stringWithFormat:@"Life%d", self.lives];
        SKNode *lifeToRemove = [self childNodeWithName:lifeNodeName];
        [lifeToRemove removeFromParent];
        self.lives--;
    }
    return self.lives == 0;
}


@end
