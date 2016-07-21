//
//  MyVideo.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyVideo : NSObject
@property(nonatomic,copy)NSString *cover;

@property(nonatomic,copy)NSString *mp4_url;

@property(nonatomic,copy)NSString *playCount;

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *videosource;

@property(nonatomic,copy)NSString  *length;


@property(nonatomic,copy)NSString *replyCount;
-(instancetype)initWithDic:(NSDictionary *)dic;
@end
