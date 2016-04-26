//
//  Singleton.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (instancetype)sharedSingleton
{
    static Singleton *s_singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_singleton = [Singleton new];
    });
    
    return s_singleton;
}

@end
