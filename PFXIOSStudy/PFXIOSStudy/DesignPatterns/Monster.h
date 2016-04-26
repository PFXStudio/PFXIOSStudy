//
//  Monster.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionInterface.h"
#import "StatusInterface.h"

@interface Monster : NSObject <ActionInterface>

@property (strong, nonatomic) id<StatusInterface> status;

- (NSInteger)attackDamage;
- (void)jump;
- (void)run;

@end
