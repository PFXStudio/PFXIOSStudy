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

/*
 프로토타입 패턴
 The prototype pattern(이하 프로토타입 패턴)은 프로토타입(원형, 기본틀 등으로 해석할 수 있겠네요.) 객체에 의해 생성될 객체의 타입이 결정되는 생성 디자인 패턴이다. 이 패턴은 새로운 객체를 생성하기 위해 copy(복제)을 이용한다.
 이 패턴은
 클라이언트 어플리케이션에서 객체 생성자의 서브 클래싱을 피한다.(반대로 추상 팩토리 패턴에서는 객체 생성자를 서브 클래싱해야만 한다.)
 주어진 애플리케이션에서 일반적인 방법(new 키워드를 이용한 방법)으로 객체를 생성할 때에 필요한 비용이 엄청난 경우에 이 비용을 없앨 수 있다.*/
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

/*
 프록시 패턴
 proxy는 대리인이라는 의미이다.
 대리인이란 일을 해야 할 본인을 대신(대리)하는 사람이다. 본인이 아니라도 가능한 일을 맡기기 위해서 대리인을 세운다.
 대리인은 어디까지나 대리에 지나지 않기 때문에 할 수 있는 일에는 한계가 있다.
 대리인이 할 수 있는 범위를 넘는 일이 발생하면, 대리인은 본인한테 와서 상담을 한다.
 오브젝트(객체) 지향에서는 '본인'도 '대리인'도 오브젝트(객체)가 된다. 바빠서 일을 할 수 없는 오브젝트 대신에 대리인 오브젝트가 어느 정도 일을 처리하게 된다.
*/
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
