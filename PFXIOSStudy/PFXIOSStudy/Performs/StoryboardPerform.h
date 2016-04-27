//
//  StoryboardPerform.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 22..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryboardPerform : NSObject

+ (UIStoryboard *)sharedCoreDataStoryBoard;
+ (UIStoryboard *)sharedMenuStoryBoard;
+ (UIStoryboard *)sharedWebStoryBoard;
+ (UIStoryboard *)sharedContainerStoryBoard;
+ (UIStoryboard *)sharedBlockStoryBoard;
+ (UIStoryboard *)sharedDispatchStoryBoard;
+ (UIStoryboard *)sharedDesignPatternStoryBoard;

@end
