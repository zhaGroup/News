//
//  MyAds.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyAds.h"

@implementation MyAds
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.title=dic[@"title"];
        
        self.imageUrl=dic[@"imgsrc"];
    }
    
    return self;
}
@end
