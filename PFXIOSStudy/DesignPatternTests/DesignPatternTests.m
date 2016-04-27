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
#import "ArcherMonster.h"
#import "KnightMonster.h"
#import "JumpStatus.h"
#import "RunStatus.h"
#import "Quest10001.h"
#import "Quest10002.h"
#import "ArcherSkillFactory.h"
#import "KnightSkillFactory.h"
#import "Player.h"
#import "QuestFactory.h"

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

- (void)testTemplateMethod
{
    Monster *archerMonster = [ArcherMonster new];
    [archerMonster attack];
    
    Monster *knightMonster = [KnightMonster new];
    [knightMonster attack];
}

- (void)testState
{
    Monster *archerMonster = [ArcherMonster new];
    archerMonster.status = [JumpStatus new];
    [archerMonster jump];
    [archerMonster jump];
    
    Monster *knightMonster = [KnightMonster new];
    knightMonster.status = [RunStatus new];
    [knightMonster run];
    [knightMonster run];
}

- (void)testStrategy
{
    Quest *quest = [Quest10001 new];
    NSLog(@"%@", [quest conditionInfo]);

    quest = [Quest10002 new];
    NSLog(@"%@", [quest conditionInfo]);
}

- (void)testAbstractFactory
{
    Player *player = [Player new];
    id<SkillFactoryInterface>
    skillFactory = [ArcherSkillFactory new];
    [player setSkill:[skillFactory createSkill]];
    [player.skill learnSkill];
    
    skillFactory = [KnightSkillFactory new];
    [player setSkill:[skillFactory createSkill]];
    [player.skill learnSkill];
}

- (void)testFactory
{
    Quest *
    quest = [QuestFactory questWithIndex:10001];
    NSLog(@"%@", [quest conditionInfo]);

    quest = [QuestFactory questWithIndex:10002];
    NSLog(@"%@", [quest conditionInfo]);
}

@end
