//
//  StoryboardPerform.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 22..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "StoryboardPerform.h"

@implementation StoryboardPerform

+ (UIStoryboard *)sharedCoreDataStoryBoard
{
    NSString * storyboardName = @"CoreData";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)sharedMenuStoryBoard
{
    NSString * storyboardName = @"Menu";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)sharedWebStoryBoard
{
    NSString * storyboardName = @"Web";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)sharedContainerStoryBoard
{
    NSString * storyboardName = @"Container";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

@end
