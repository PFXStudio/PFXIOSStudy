//
//  Player.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkillInterface.h"

@interface Player : NSObject

@property (strong, nonatomic) id<SkillInterface> skill;

@end
