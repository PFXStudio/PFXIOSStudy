//
//  Enums.h
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 22..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#ifndef Enums_h
#define Enums_h

typedef NS_ENUM(NSInteger, MenuType)
{
    MenuType_CoreData,
    MenuType_ContainerView,
    MenuType_Block,
    MenuType_Dispatch,
    MenuType_DesignPattern,
    MenuType_Network,
    MenuType_Serialize,
    MenuType_Algorithm,
    MenuType_CodeTip,
    
    MenuType_Max,
};

typedef NS_ENUM(NSInteger, CoreDataTableSectionType)
{
    CoreDataTableSectionType_Data,
    CoreDataTableSectionType_Add,
    
    CoreDataTableSectionType_Max,
};

typedef NS_ENUM(NSInteger, ErrorType)
{
    ErrorType_FilePath = -80000,
    ErrorType_AppStoreVersion,
    
    ErrorType_Max,
};


#endif /* Enums_h */
