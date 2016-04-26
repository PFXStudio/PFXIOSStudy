//
//  Monster.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "Monster.h"

@implementation Monster

- (void)attack
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%ld", [self attackDamage]);
}

- (void)defence
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (NSInteger)attackDamage
{
    return 0;
}

- (void)jump
{
    [self.status jumpWithMonster:self];
}

- (void)run
{
    [self.status runWithMonster:self];
}

@end
