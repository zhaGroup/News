//
//  xinlang.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xinlang : NSObject
@property(nonatomic,copy)NSString *imageName;

@property(nonatomic,copy)NSString *labelName;

-(instancetype)initWithDic:(NSDictionary*)dic;

@end
