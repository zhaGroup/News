//
//  smallLive.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "smallLive.h"

@implementation smallLive
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.title=dic[@"title"];
        self.imageUrl=dic[@"imgsrc"];
        self.source=dic[@"source"];
        self.startTime=dic[@"live_info"][@"start_time"];
    }
    return self;
}
@end
