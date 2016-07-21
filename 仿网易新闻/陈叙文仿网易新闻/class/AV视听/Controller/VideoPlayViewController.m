//
//  VideoPlayViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoPlayViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoPlayViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation VideoPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",self.url);
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
