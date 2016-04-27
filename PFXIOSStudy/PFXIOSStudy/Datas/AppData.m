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

+ (instancetype)appDataWithName:(NSString *)name
{
    AppData *appData = [AppData new];
    appData.name = name;
    
    return appData;
}


@end
