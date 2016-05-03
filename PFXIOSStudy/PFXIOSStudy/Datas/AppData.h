//
//  AppData.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject

@property (strong, nonatomic) NSString *uniqueKey;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSMutableArray *imagePaths;

- (NSString *)imageKeyWithIndex:(NSInteger)index;

@end
