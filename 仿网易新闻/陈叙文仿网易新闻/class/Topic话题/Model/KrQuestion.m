//
//  KrQuestion.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "KrQuestion.h"

@implementation KrQuestion

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.alias=dic[@"alias"];
        self.picurl=dic[@"picurl"];
        
        self.headpicurl=dic[@"headpicurl"];
        self.name=dic[@"name"];
        self.des=dic[@"description"];
        self.classification=dic[@"classification"];
        self.concernCount=dic[@"concernCount"];
        self.title=dic[@"title"];
        self.questionCount=dic[@"questionCount"];
        self.answerCount=dic[@"answerCount"];
        
        
    
        
    }
    return self;
}

@end
