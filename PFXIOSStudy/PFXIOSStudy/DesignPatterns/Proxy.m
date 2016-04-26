//
//  Proxy.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "Proxy.h"
#import "Monster.h"

@interface Proxy ()

@property (strong, nonatomic) Monster *monster;

@end


@implementation Proxy

- (instancetype)initWithMonster:(Monster *)monster
{
    self = [super init];
    self.monster = monster;
    
    return self;
}

- (void)attack
{
    [self.monster attack];
}

- (void)defence
{
    [self.monster defence];
}

@end
