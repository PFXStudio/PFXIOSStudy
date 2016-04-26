//
//  Facade.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "Facade.h"
#import "Monster.h"

@interface Facade ()

@property (strong, nonatomic) Monster *bossMonster;
@property (strong, nonatomic) Monster *archMonster;
@property (strong, nonatomic) Monster *knightMonster;

@end

@implementation Facade

- (instancetype)init
{
    self = [super init];
    self.bossMonster = [Monster new];
    self.archMonster = [Monster new];
    self.knightMonster = [Monster new];
    
    return self;
}

- (void)attack
{
    [self.bossMonster attack];
    [self.archMonster attack];
    [self.knightMonster attack];
}

- (void)defence
{
    [self.bossMonster defence];
    [self.archMonster defence];
    [self.knightMonster defence];
}

@end
