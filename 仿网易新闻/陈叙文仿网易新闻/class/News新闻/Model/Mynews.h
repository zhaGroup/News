//
//  Mynews.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mynews : NSObject
@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *source;

@property(nonatomic,copy)NSString *imageURl;

@property(nonatomic,copy)NSString *url;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
