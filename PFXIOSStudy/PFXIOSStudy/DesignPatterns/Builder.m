//
//  Builder.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "Builder.h"

@interface Builder ()

@property (strong, nonatomic) id<BuilderInterface> objectBuilder;

@end

@implementation Builder

+ (instancetype)builderWithObjectBuilder:(id<BuilderInterface>)objectBuilder
{
    Builder *builder = [Builder new];
    builder.objectBuilder = objectBuilder;
    
    return builder;
}

- (void)buildObject
{
    [self.objectBuilder buildItems];
    [self.objectBuilder buildStats];
}

@end
