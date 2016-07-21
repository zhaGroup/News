//
//  smallLive.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface smallLive : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *source;

@property(nonatomic,copy)NSString *imageUrl;

@property(nonatomic,copy)NSString *startTime;

-(instancetype)initWithDic:(NSDictionary*)dic;

@end
