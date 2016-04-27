//
//  ArcherSkillFactory.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "ArcherSkillFactory.h"
#import "FireSkill.h"

@implementation ArcherSkillFactory

- (id<SkillInterface>)createSkill
{
    FireSkill *fireSkill = [FireSkill new];
    return fireSkill;
}

@end
