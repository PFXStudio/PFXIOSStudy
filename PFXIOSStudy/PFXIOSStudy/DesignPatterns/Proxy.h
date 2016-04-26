//
//  Proxy.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProxyInterface.h"

@class Monster;
@interface Proxy : NSObject <ProxyInterface>

- (instancetype)initWithMonster:(Monster *)monster;

@end
