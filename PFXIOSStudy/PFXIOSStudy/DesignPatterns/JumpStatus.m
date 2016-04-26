//
//  JumpStatus.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "JumpStatus.h"
#import "Monster.h"
#import "IdleStatus.h"

@implementation JumpStatus

- (void)jumpWithMonster:(Monster *)monster
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    monster.status = [IdleStatus new];
}

- (void)runWithMonster:(Monster *)monster
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    monster.status = [IdleStatus new];
}


@end
