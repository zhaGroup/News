//
//  MyVideo.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyVideo.h"

@implementation MyVideo
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.cover=dic[@"cover"];
        self.mp4_url=dic[@"mp4_url"];
        self.playCount=dic[@"playCount"];
        self.title=dic[@"title"];
        self.videosource=dic[@"topicName"];
        self.length=dic[@"length"];
        self.replyCount=dic[@"replyCount"];
    }
    return self;
}



//@property(nonatomic,copy)NSString *cover;
//
//@property(nonatomic,copy)NSString *mp4_url;
//
//@property(nonatomic,assign)NSString *playCount;
//
//@property(nonatomic,copy)NSString *title;
//
//@property(nonatomic,copy)NSString *videosource;
//
//@property(nonatomic,assign)NSString *length;
@end
