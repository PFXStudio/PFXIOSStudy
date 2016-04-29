//
//  AppListParser.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "AppListParser.h"

@interface AppListParser () <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray *appDatas;
@property (strong, nonatomic) NSString *startElement;

@end

@implementation AppListParser

/*
 <id im:id="1103240542" im:bundleId="com.yeimac.yei1765">https://itunes.apple.com/kr/app/air-gunship-pro-combat-flight/id1103240542?mt=8&amp;uo=2</id>
 
 <title>Air Gunship Pro - Combat Flight Helicopter Race - Yeisela Ordonez Vaquiro</title>
 
 
 
 <im:name>Air Gunship Pro - Combat Flight Helicopter Race</im:name>
 
 <link rel="alternate" type="text/html" href="https://itunes.apple.com/kr/app/air-gunship-pro-combat-flight/id1103240542?mt=8&amp;uo=2"/>
 
 <im:contentType term="Application" label="App"/>
 
 <category im:id="6014" term="Games" scheme="https://itunes.apple.com/kr/genre/ios-geim/id6014?mt=8&amp;uo=2" label="게임"/>
 
 <im:artist href="https://itunes.apple.com/kr/developer/yeisela-ordonez-vaquiro/id906605084?mt=8&amp;uo=2">Yeisela Ordonez Vaquiro</im:artist>
 
 <im:price amount="0.00000" currency="USD">받기</im:price>
 
 <im:image height="53">http://is4.mzstatic.com/image/thumb/Purple49/v4/9a/e1/d4/9ae1d42a-23fe-d6c2-f12e-2416a5553cc9/pr_source.jpg/53x53bb-85.png</im:image>
 
 <im:image height="75">http://is1.mzstatic.com/image/thumb/Purple49/v4/9a/e1/d4/9ae1d42a-23fe-d6c2-f12e-2416a5553cc9/pr_source.jpg/75x75bb-85.png</im:image>
 
 <im:image height="100">http://is3.mzstatic.com/image/thumb/Purple49/v4/9a/e1/d4/9ae1d42a-23fe-d6c2-f12e-2416a5553cc9/pr_source.jpg/100x100bb-85.png</im:image>
 
 <rights>&#169; 2016 yeisela.mac@gmail.com</rights>
 
 <im:releaseDate label="2016.04.29">2016-04-29T00:00:00-07:00</im:releaseDate>
 */

- (void)parseWithData:(NSData *)data completion:(void(^)(NSArray *appDatas))completion failure:(void(^)(NSError *error))failure
{
    self.appDatas = [NSMutableArray array];

    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    xmlParser.delegate = self;
    [xmlParser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict
{
    self.startElement = elementName;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.startElement isEqualToString:@"id"] == YES)
    {
        NSLog(@"id im:id %@", string);
        return;
    }

    if ([self.startElement isEqualToString:@"title"] == YES)
    {
        NSLog(@"title %@", string);
        return;
    }

    if ([self.startElement isEqualToString:@"im:image"] == YES)
    {
        NSLog(@"im:image %@", string);
        return;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName
{
    NSLog(@"didEndElement %@ namespaceURI %@ qualifiedName %@", elementName, namespaceURI, qName);
}


@end
