//
//  AppData.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "AppData.h"

@interface AppData ()


@end

@implementation AppData

- (instancetype)init
{
    self = [super init];
    self.imagePaths = [NSMutableArray array];
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"uniqueKey : %@\ntitle : %@\nartist : %@\nimagePaths : %@", self.uniqueKey, self.title, self.artist, self.imagePaths];
}

- (NSString *)imageKeyWithIndex:(NSInteger)index
{
    if (index >= [self.imagePaths count])
    {
        return nil;
    }

    NSString *imagePath = [self.imagePaths objectAtIndex:index];
    NSString *lastPath = [imagePath lastPathComponent];
    return [NSString stringWithFormat:@"%@-%@", self.uniqueKey, lastPath];
}

@end
