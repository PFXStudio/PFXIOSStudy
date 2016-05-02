//
//  AppListParser.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "AppListParser.h"
#import "AppData.h"

@interface AppListParser () <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray *appDatas;
@property (strong, nonatomic) NSString *elementName;
@property (strong, nonatomic) AppData *appData;
@property (strong, nonatomic) void(^completionBlock)(NSArray *appDatas, NSError *error);


@end

@implementation AppListParser

/*

 <entry>
 <updated>2016-05-02T01:35:43-07:00</updated>
 
 <id im:id="1098065914" im:bundleId="com.matchthree.364jewel">https://itunes.apple.com/kr/app/monster-candy-revenge-tap/id1098065914?mt=8&amp;uo=2</id>
 
 <title>Monster Candy Revenge Tap Puzzle Game - Varaporn Meunnoy</title>
 
 
 
 <im:name>Monster Candy Revenge Tap Puzzle Game</im:name>
 
 <link rel="alternate" type="text/html" href="https://itunes.apple.com/kr/app/monster-candy-revenge-tap/id1098065914?mt=8&amp;uo=2"/>
 
 <im:contentType term="Application" label="App"/>
 
 <category im:id="6014" term="Games" scheme="https://itunes.apple.com/kr/genre/ios-geim/id6014?mt=8&amp;uo=2" label="게임"/>
 
 <im:artist href="https://itunes.apple.com/kr/developer/varaporn-meunnoy/id968979257?mt=8&amp;uo=2">Varaporn Meunnoy</im:artist>
 
 <im:price amount="0.00000" currency="USD">받기</im:price>
 
 <im:image height="53">http://is4.mzstatic.com/image/thumb/Purple49/v4/f1/38/94/f1389443-d1e6-f0d7-247c-3041571cb23a/pr_source.png/53x53bb-85.png</im:image>
 
 <im:image height="75">http://is1.mzstatic.com/image/thumb/Purple49/v4/f1/38/94/f1389443-d1e6-f0d7-247c-3041571cb23a/pr_source.png/75x75bb-85.png</im:image>
 
 <im:image height="100">http://is3.mzstatic.com/image/thumb/Purple49/v4/f1/38/94/f1389443-d1e6-f0d7-247c-3041571cb23a/pr_source.png/100x100bb-85.png</im:image>
 
 <rights>&#169; Varaporn Meunnoy</rights>
 
 <im:releaseDate label="2016.05.01">2016-05-01T19:18:22-07:00</im:releaseDate>
 
 
 <content type="html">&lt;table border=&quot;0&quot; width=&quot;100%&quot;&gt;
 &lt;tr&gt;
 &lt;td&gt;
 &lt;table border=&quot;0&quot; width=&quot;100%&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;
 &lt;tr valign=&quot;top&quot; align=&quot;left&quot;&gt;
 
 &lt;td align=&quot;center&quot; width=&quot;166&quot; valign=&quot;top&quot;&gt;
 &lt;a href=&quot;https://itunes.apple.com/kr/app/monster-candy-revenge-tap/id1098065914?mt=8&amp;uo=2&quot;&gt;&lt;img border=&quot;0&quot; alt=&quot;Varaporn Meunnoy - Monster Candy Revenge Tap Puzzle Game 앨범 사진&quot; src=&quot;http://is3.mzstatic.com/image/thumb/Purple49/v4/f1/38/94/f1389443-d1e6-f0d7-247c-3041571cb23a/pr_source.png/100x100bb-85.png&quot; /&gt;&lt;/a&gt;
 &lt;/td&gt;
 &lt;td width=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; width=&quot;10&quot; height=&quot;1&quot; src=&quot;https://s.mzstatic.com/images/spacer.gif&quot; /&gt;&lt;/td&gt;
 &lt;td width=&quot;95%&quot;&gt;
 
 
 &lt;b&gt;&lt;a href=&quot;https://itunes.apple.com/kr/app/monster-candy-revenge-tap/id1098065914?mt=8&amp;uo=2&quot;&gt;Monster Candy Revenge Tap Puzzle Game&lt;/a&gt;&lt;/b&gt;&lt;br/&gt;
 
 
 
 
 
 &lt;a href=&quot;https://itunes.apple.com/kr/developer/varaporn-meunnoy/id968979257?mt=8&amp;amp;uo=2&quot;&gt;Varaporn Meunnoy&lt;/a&gt;
 
 &lt;font size=&quot;2&quot; face=&quot;Helvetica,Arial,Geneva,Swiss,SunSans-Regular&quot;&gt;
 
 &lt;br/&gt;
 &lt;b&gt;장르:&lt;/b&gt; &lt;a href=&quot;https://itunes.apple.com/kr/genre/ios-geim/id6014?mt=8&amp;uo=2&quot;&gt;게임&lt;/a&gt;
 
 &lt;br/&gt;
 &lt;b&gt;발매일:&lt;/b&gt; 2016.05.01
 
 &lt;/font&gt;
 &lt;/td&gt;
 &lt;/tr&gt;
 &lt;/table&gt;
 &lt;/td&gt;
 &lt;/tr&gt;
 &lt;tr&gt;
 &lt;td&gt;
 
 
 
 &lt;font size=&quot;2&quot; face=&quot;Helvetica,Arial,Geneva,Swiss,SunSans-Regular&quot;&gt; &amp;#169; © Varaporn Meunnoy&lt;/font&gt;
 
 &lt;/td&gt;
 &lt;/tr&gt;
 &lt;/table&gt;
 </content>
 
 </entry>
 
 */

- (void)parseWithData:(NSData *)data completion:(void(^)(NSArray *appDatas, NSError *error))completion
{
    self.appDatas = [NSMutableArray array];
    self.completionBlock = completion;
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    xmlParser.delegate = self;
    [xmlParser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict
{
    self.elementName = elementName;
    if ([elementName isEqualToString:@"entry"] == YES)
    {
        self.appData = [AppData new];
        return;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    self.elementName = @"";
    if (self.completionBlock == nil)
    {
        return;
    }
    
    self.completionBlock(self.appDatas, nil);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.elementName isEqualToString:@"im:artist"] == YES)
    {
        self.appData.artist = string;
        return;
    }

    if ([self.elementName isEqualToString:@"title"] == YES)
    {
        self.appData.title = string;
        return;
    }

    if ([self.elementName isEqualToString:@"im:image"] == YES)
    {
        [self.appData.imagePaths addObject:string];
        return;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName
{
    self.elementName = @"";
    if ([elementName isEqualToString:@"entry"] == YES)
    {
        [self.appDatas addObject:self.appData];
        NSLog(@"%@", [self.appData description]);
        return;
    }
}


@end
