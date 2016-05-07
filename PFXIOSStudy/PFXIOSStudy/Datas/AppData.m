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

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.uniqueKey = [aDecoder decodeObjectForKey:@"uniqueKey"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.artist = [aDecoder decodeObjectForKey:@"artist"];
    self.link = [aDecoder decodeObjectForKey:@"link"];
    self.imagePaths = [aDecoder decodeObjectForKey:@"imagePaths"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.artist forKey:@"artist"];
    [aCoder encodeObject:self.link forKey:@"link"];
    [aCoder encodeObject:self.imagePaths forKey:@"imagePaths"];
}

@end
