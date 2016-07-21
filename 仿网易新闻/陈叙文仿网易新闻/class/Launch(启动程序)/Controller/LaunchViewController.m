//
//  LaunchViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LaunchViewController.h"
#import "MainTabBarController.h"
@interface LaunchViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property(nonatomic,strong)NSTimer *time;
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageV.image=[UIImage imageNamed:@"3.jpg"];
    
    self.time=[[NSTimer alloc]init];
  self.time=  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
    
}


-(void)timeOut
{
    [self toMain:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


//去主程序
- (IBAction)toMain:(id)sender
{
     [self.time invalidate];
    
    MainTabBarController *main=[MainTabBarController new];
    [UIApplication sharedApplication].keyWindow.rootViewController=main;
    [[UIApplication sharedApplication].keyWindow  makeKeyAndVisible];
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
