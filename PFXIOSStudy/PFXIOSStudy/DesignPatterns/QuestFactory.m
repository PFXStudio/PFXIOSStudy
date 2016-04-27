//
//  QuestFactory.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "QuestFactory.h"
#import "Quest10002.h"
#import "Quest10001.h"

@implementation QuestFactory

+ (Quest *)questWithIndex:(NSInteger)index
{
    if (index == 10001)
    {
        return [Quest10001 new];
    }

    if (index == 10002)
    {
        return [Quest10002 new];
    }

    return nil;
}

@end
