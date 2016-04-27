//
//  SkillFactoryInterface.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkillInterface.h"

@protocol SkillFactoryInterface <NSObject>

- (id<SkillInterface>)createSkill;

@end
