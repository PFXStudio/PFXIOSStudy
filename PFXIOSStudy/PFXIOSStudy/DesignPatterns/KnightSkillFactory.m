//
//  KnightSkillFactory.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "KnightSkillFactory.h"
#import "IceSkill.h"

@implementation KnightSkillFactory

- (id<SkillInterface>)createSkill
{
    IceSkill *skill = [IceSkill new];
    
    return skill;
}

@end
