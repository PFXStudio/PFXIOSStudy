//
//  Builder.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderInterface.h"

@interface Builder : NSObject

+ (instancetype)builderWithObjectBuilder:(id<BuilderInterface>)objectBuilder;

- (void)buildObject;

@end
