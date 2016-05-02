//
//  ImagePerform.h
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 5. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagePerform : NSObject

+ (instancetype)sharedImagePerform;
- (BOOL)saveWithName:(NSString *)imageName image:(UIImage *)image;
- (UIImage *)loadWithName:(NSString *)imageName;


@end
