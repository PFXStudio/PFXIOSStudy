//
//  ImagePerform.m
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 5. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "ImagePerform.h"

@implementation ImagePerform

+ (instancetype)sharedImagePerform
{
    static ImagePerform *s_imagePerform = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_imagePerform = [ImagePerform new];
    });
    
    return s_imagePerform;
}

- (BOOL)saveWithName:(NSString *)imageName image:(UIImage *)image
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * path = [paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:kImageFolderName];
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSString * imagePath = [path stringByAppendingPathComponent:imageName];
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    
    return YES;
    
}

- (UIImage *)loadWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    if (image != nil)
    {
        return image;
    }
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * path = [paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:kImageFolderName];
    NSString * imagePath = [path stringByAppendingPathComponent:imageName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath] == NO)
    {
        return nil;
    }
    
    NSData * data = [[NSFileManager defaultManager] contentsAtPath:imagePath];
    return [UIImage imageWithData:data];
}

@end
