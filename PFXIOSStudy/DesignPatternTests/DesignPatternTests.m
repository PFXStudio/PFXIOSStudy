//
//  DesignPatternTests.m
//  DesignPatternTests
//
//  Created by succorer on 2016. 4. 26..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Prototype.h"
#import "Singleton.h"
#import "Monster.h"
#import "Proxy.h"
#import "Facade.h"
#import "BuilderInterface.h"
#import "Builder.h"
#import "MonsterBuilder.h"
#import "PlayerBuilder.h"

@interface DesignPatternTests : XCTestCase

@end

@implementation DesignPatternTests

- (void)testPrototype
{
    Prototype *prototype1 = [Prototype protoTypeWithName:@"PARK" age:@"10"];
    
    Prototype *prototype2 = [prototype1 copy];
    [prototype2 setName:@"JIN"];
    [prototype2 setAge:@"20"];
    
    Prototype *prototype3 = [prototype2 copy];
    [prototype3 setName:@"WOO"];
    [prototype3 setAge:@"30"];
    
    NSLog(@"%@", [prototype1 description]);
    NSLog(@"%@", [prototype2 description]);
    NSLog(@"%@", [prototype3 description]);
}

- (void)testProxy
{
    Monster *monster = [Monster new];
    
    Proxy *proxy = [[Proxy alloc] initWithMonster:monster];
    [proxy attack];
    [proxy defence];
}

- (void)testFacade
{
    Facade *facade = [Facade new];
    [facade attack];
    [facade defence];
}

- (void)testSingleton
{
    [Singleton sharedSingleton];
}

- (void)testBuilder
{
    MonsterBuilder *monsterBuilder = [MonsterBuilder new];
    Builder *
    builder = [Builder builderWithObjectBuilder:monsterBuilder];
    [builder buildObject];

    PlayerBuilder *playerBuilder = [PlayerBuilder new];
    builder = [Builder builderWithObjectBuilder:playerBuilder];
    [builder buildObject];
}

@end
