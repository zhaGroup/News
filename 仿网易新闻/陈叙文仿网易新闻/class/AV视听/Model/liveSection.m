//
//  liveSection.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "liveSection.h"
#import "smallLive.h"
@implementation liveSection
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.title=dic[@"title"];
        
        NSMutableArray *mutableArray=[NSMutableArray array];
        
        NSArray *dataArray=dic[@"specialextra"];
        for (NSDictionary *dic in dataArray)
        {
            smallLive *small=[[smallLive alloc]initWithDic:dic];
            
            [mutableArray addObject:small];
        }
        
        self.dataArray=[mutableArray copy];
    
    }
    return self;
}
@end
