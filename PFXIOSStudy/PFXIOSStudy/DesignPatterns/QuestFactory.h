//
//  QuestFactory.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Quest;
@interface QuestFactory : NSObject

+ (Quest *)questWithIndex:(NSInteger)index;

@end
