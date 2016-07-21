//
//  NetManager.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"
#import <AFNetworking.h>
#import "MyAds.h"
#import "Mynews.h"

#import "MyVideo.h"

#import "KrQuestion.h"

#import "liveSection.h"
@implementation NetManager



+(void)getTouTiaoDataWithParameter:(NSInteger)count andTitle:(NSString *)title andBlcok:(MyCallBack)blcok
{
    NSString *path=[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/%@/%ld0-20.html",title,count];
    
    AFHTTPSessionManager  *manager=[AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        //        NSString *data=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        
        NSMutableArray  *dataArray=[NSMutableArray arrayWithArray:dataDic[title]];
        
        NSMutableArray *mutableArrayOne=[NSMutableArray array];
        NSMutableArray  *mutableArrayTwo=[NSMutableArray array];
        
        NSArray *firstArray=dataArray[0][@"ads"];
        if (firstArray)
        {
            for (NSDictionary *dic in firstArray)
            {
                MyAds  *ads=[[MyAds alloc]initWithDic:dic];
                
                [mutableArrayOne addObject:ads];
            }
        }
        else
        {
            mutableArrayOne=nil;
        }
        
        for (NSDictionary *dic in dataArray)
        {
            Mynews *news=[[Mynews alloc]initWithDic:dic];
            
            [mutableArrayTwo addObject:news];
        }
        
        
        blcok(mutableArrayOne,mutableArrayTwo);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"%@",error);
    }];
}

+(void)getVedioWithBlock:(myVideoBack)block
{
    
}

+(void)getVedioWithKeyWord:(NSString *)keyword andBlock:(myVideoBack)block
{
    NSString *path=[NSString stringWithFormat:@"http://c.3g.163.com/recommend/getChanListNews?channel=T1457068979049&passport=&devId=n%%2BhZvfpbtD%%2Bust6DNThqfl21ZYMzeX4NfuAk5KKWG9Gbk3B1A8hxUwKpN6z%%2BAOL4&size=10&version=11.1&spever=false&net=wifi&lat=ok5KtiTOLVOrxAyNKf4WEQ%%3D%%3D&lon=Iw6TWDt0KhbrNBUB0Qh7ow%%3D%%3D&%@&encryption=1&canal=appstore",keyword];
    
    AFHTTPSessionManager  *manager=[AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        
        NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //       NSLog(@"%@",dataDic);
        NSMutableArray *mutableArray=[NSMutableArray array];
        NSArray *dataArray=dataDic[@"视频"];
        for (NSDictionary *dic in dataArray)
        {
            MyVideo *video=[[MyVideo alloc]initWithDic:dic];
            
            [mutableArray addObject:video];
        }
        block(mutableArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
}

+(void)getLiveDataWithBlock:(MyCallBack)block
{
    NSString *path=@"http://c.m.163.com/nc/live/list/5rex5Zyz/0-20.html";
    
    AFHTTPSessionManager  *manager=[AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        
        NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSMutableArray *mutableArray=[NSMutableArray array];
        NSArray *dataArray=dataDic[@"T1462958418713"];
        
        
        NSDictionary *dic=dataArray[0];
        
        NSMutableArray *headArray=[NSMutableArray array];
        
        [headArray addObject:dic];
        for (int i=1; i<dataArray.count; i++)
        {
            NSDictionary *dic=dataArray[i];
            liveSection *live=[[liveSection alloc]initWithDic:dic];
            
            [mutableArray addObject:live];
            
        }
        block(headArray,mutableArray);
   
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"%@",error);
    }];
}
+(void)getQuestionWith:(NSInteger)count  andBlock:(myVideoBack)block
{
     NSString *path=[NSString stringWithFormat:@"http://c.3g.163.com/newstopic/list/expert/5rex5Zyz/%ld0-10.html",count];
    
    AFHTTPSessionManager  *manager=[AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        
        NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
      
        NSMutableArray *mutableArray=[NSMutableArray array];
        NSArray *dataArray=dataDic[@"data"][@"expertList"];
        for (NSDictionary *dic in dataArray)
        {
            //
            KrQuestion *question=[[KrQuestion alloc]initWithDic:dic];
            
            [mutableArray addObject:question];
        }
        block(mutableArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"%@",error);
    }];
}

@end
