//
//  xinlang.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "xinlang.h"

@implementation xinlang
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.labelName=dic[@"imageName"];
        self.imageName=dic[@"title"];
    }
    return self;
}
@end
