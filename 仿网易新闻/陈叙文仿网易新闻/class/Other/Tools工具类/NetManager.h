//
//  NetManager.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^MyCallBack)(NSArray *obj1, NSArray *obj2);

typedef void (^myVideoBack)(id obj);
@interface NetManager : NSObject


//得到头条数据
+(void)getTouTiaoDataWithParameter:(NSInteger )count andTitle:(NSString *)title andBlcok:(MyCallBack)blcok;

//得到视频数据
+(void)getVedioWithBlock:(myVideoBack)block;

+(void)getVedioWithKeyWord:(NSString*)keyword  andBlock:(myVideoBack)block;


//得到直播数据
+(void)getLiveDataWithBlock:(MyCallBack)block;



//得到话题的问吧数据
+(void)getQuestionWith:(NSInteger)count  andBlock:(myVideoBack)block;
@end
