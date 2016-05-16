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

// 프로토타입 패턴
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

// 프록시 패턴
- (void)testProxy
{
    Monster *monster = [Monster new];
    
    Proxy *proxy = [[Proxy alloc] initWithMonster:monster];
    [proxy attack];
    [proxy defence];
}

// 퍼사드 패턴
- (void)testFacade
{
    Facade *facade = [Facade new];
    [facade attack];
    [facade defence];
}

// 싱글톤 패턴
- (void)testSingleton
{
    [Singleton sharedSingleton];
}

// 빌더 패턴
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

// 템플릿 메소드 패턴
- (void)testTemplateMethod
{
    Monster *archerMonster = [ArcherMonster new];
    [archerMonster attack];
    
    Monster *knightMonster = [KnightMonster new];
    [knightMonster attack];
}

// 스테이트 패턴
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

// 스트레이티지 패턴
- (void)testStrategy
{
    Quest *quest = [Quest10001 new];
    NSLog(@"%@", [quest conditionInfo]);

    quest = [Quest10002 new];
    NSLog(@"%@", [quest conditionInfo]);
}

// 앱스트랙트 팩토리 패턴
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

// 팩토리 패턴
- (void)testFactory
{
    Quest *
    quest = [QuestFactory questWithIndex:10001];
    NSLog(@"%@", [quest conditionInfo]);

    quest = [QuestFactory questWithIndex:10002];
    NSLog(@"%@", [quest conditionInfo]);
}

@end
