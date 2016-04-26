//
//  Proxy.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionInterface.h"

@class Monster;
@interface Proxy : NSObject <ActionInterface>

- (instancetype)initWithMonster:(Monster *)monster;

@end
