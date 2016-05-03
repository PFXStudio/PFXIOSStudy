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

+ (UIStoryboard *)sharedBlockStoryBoard
{
    NSString * storyboardName = @"Block";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)sharedDispatchStoryBoard
{
    NSString * storyboardName = @"Dispatch";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)sharedDesignPatternStoryBoard
{
    NSString * storyboardName = @"DesignPattern";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)sharedNetworkStoryBoard
{
    NSString * storyboardName = @"Network";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)sharedSerializeStoryBoard
{
    NSString * storyboardName = @"Serialize";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

@end
