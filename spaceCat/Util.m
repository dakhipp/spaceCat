//
//  Util.m
//  spaceCat
//
//  Created by dakota hipp on 7/4/14.
//  Copyright (c) 2014 dakota hipp. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max{
    return arc4random()%(max - min) + min;
}

@end
