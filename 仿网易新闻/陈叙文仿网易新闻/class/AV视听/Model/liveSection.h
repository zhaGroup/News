//
//  liveSection.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface liveSection : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray *dataArray;

-(instancetype)initWithDic:(NSDictionary*)dic;
@end
