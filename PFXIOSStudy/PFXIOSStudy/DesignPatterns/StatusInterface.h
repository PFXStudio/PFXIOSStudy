//
//  StatusInterface.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Monster;
@protocol StatusInterface <NSObject>

- (void)jumpWithMonster:(Monster *)monster;
- (void)runWithMonster:(Monster *)monster;

@end

