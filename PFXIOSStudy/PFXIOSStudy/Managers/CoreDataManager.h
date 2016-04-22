//
//  CoreDataManager.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 22..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject

+ (instancetype)sharedCoreDataManager;

- (NSManagedObjectContext *)testEntityContext;
- (void)saveTestEntityContext;

@end
