//
//  Prototype.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Prototype : NSObject <NSCopying>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *age;

+ (instancetype)protoTypeWithName:(NSString *)name age:(NSString *)age;

@end
