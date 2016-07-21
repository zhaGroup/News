//
//  KrQuestion.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KrQuestion : NSObject
@property(nonatomic,copy)NSString *alias;

@property(nonatomic,copy)NSString *picurl;


@property(nonatomic,copy)NSString *headpicurl;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *des;

@property(nonatomic,copy)NSString *classification;

@property(nonatomic,assign)NSNumber *concernCount;

@property(nonatomic,copy)NSString *title;


@property(nonatomic,assign)NSNumber *questionCount;

@property(nonatomic,assign)NSNumber *answerCount;


-(instancetype)initWithDic:(NSDictionary*)dic;

@end
