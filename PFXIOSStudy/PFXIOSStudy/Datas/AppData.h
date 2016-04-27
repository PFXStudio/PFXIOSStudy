//
//  AppData.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject

@property (strong, nonatomic) NSString *name;

+ (instancetype)appDataWithName:(NSString *)name;

@end
