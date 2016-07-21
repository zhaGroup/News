//
//  Mynews.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Mynews.h"

@implementation Mynews

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.title=dic[@"title"];
        self.source=dic[@"source"];
        self.imageURl=dic[@"imgsrc"];
        self.url=dic[@"url_3w"];
    }
    return self;
}
@end
