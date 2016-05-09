//
//  AppData.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject <NSCoding>

@property (strong, nonatomic) NSString *uniqueKey;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSMutableArray *imagePaths;

+ (instancetype)appDataWithUniqueKey:(NSString *)uniqueKey title:(NSString *)title artist:(NSString *)artist link:(NSString *)link imagePaths:(NSArray *)imagePaths;

- (NSString *)imageKeyWithIndex:(NSInteger)index;

@end
