//
//  MyAds.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAds : NSObject
@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *imageUrl;


-(instancetype)initWithDic:(NSDictionary*)dic;
@end
