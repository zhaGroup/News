//
//  MainTabBarController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MainTabBarController.h"
#import "NewsViewController.h"

#import "AVViewController.h"
#import "TopViewController.h"
#import "MeViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子视图控制器
    [self addChildViewController];
    
}

-(void)addChildViewController
{
    NewsViewController *new=[[NewsViewController alloc]init];
    [self  initWith:new andTitle:@"新闻" andNormalIMageName:@"tabbar_icon_news_normal" andSeletedImage:@"tabbar_icon_news_highlight" ];
    
    
    AVViewController *av=[[AVViewController alloc]init];
        [self  initWith:av andTitle:@"视听" andNormalIMageName:@"tabbar_icon_media_normal" andSeletedImage:@"tabbar_icon_media_highlight" ];
    
    TopViewController *top=[[TopViewController alloc]init];
    
    [self  initWith:top andTitle:@"话题" andNormalIMageName:@"tabbar_icon_found_normal" andSeletedImage:@"tabbar_icon_found_highlight" ];
    

    MeViewController *me=[[MeViewController alloc]init];
    
    [self  initWith:me andTitle:@"我" andNormalIMageName:@"tabbar_icon_me_normal" andSeletedImage:@"tabbar_icon_me_highlight" ];
    
}

-(void)initWith:(UIViewController*)VC andTitle:(NSString *)title andNormalIMageName:(NSString*)imageOne andSeletedImage:(NSString*)imageTwo
{
    
    
    VC.title=title;
    VC.tabBarItem.image=[UIImage imageNamed:imageOne];
    VC.tabBarItem.selectedImage=[UIImage imageNamed:imageTwo];
    
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:VC ]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
