//
//  modelManager.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "modelManager.h"
#import "xinlang.h"
@implementation modelManager

+(NSArray*)getAllShare
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"share.plist" ofType:nil];
    NSArray *ShareArray=[NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mutableArray=[NSMutableArray array];
    for (NSDictionary *dic in ShareArray)
    {
        xinlang *model=[[xinlang alloc]initWithDic:dic];
        
        [mutableArray addObject:model];
    }
    
    return [mutableArray copy];
}
@end
