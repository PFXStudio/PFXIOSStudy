//
//  AppListParser.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppListParser : NSObject

- (void)parseWithData:(NSData *)data completion:(void(^)(NSArray *appDatas, NSError *error))completion;

@end
