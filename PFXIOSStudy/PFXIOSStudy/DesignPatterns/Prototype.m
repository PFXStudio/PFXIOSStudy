//
//  Prototype.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "Prototype.h"

@implementation Prototype

+ (instancetype)protoTypeWithName:(NSString *)name age:(NSString *)age
{
    Prototype *prototype = [Prototype new];
    prototype.name = name;
    prototype.age = age;
    
    return prototype;
}

- (id)copyWithZone:(NSZone *)zone {
    Prototype *prototype = [[[self class] allocWithZone:zone] init];
    prototype.name = self.name;
    prototype.age = self.age;
    
    return prototype;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name : %@, age : %@", self.name, self.age];
}

@end
