//
//  MyViewCell.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyViewCell.h"
#import <UIImageView+AFNetworking.h>
@implementation MyViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setVideo:(MyVideo *)video
{
    _video=video;
    [self.imageV setImageWithURL:[NSURL URLWithString:_video.cover]];
    
    self.playNumberLabel.text=[self  getPlayNumberLabelTextWithVideo:_video ];
//
    self.sourceLabel.text=_video.videosource;
//
    self.replyLabel.text=[NSString stringWithFormat:@"%@",_video.replyCount];
    
    self.titleLabel.text=_video.title;
    
}

-(NSString*)getPlayNumberLabelTextWithVideo:(MyVideo*)video
{
    return  [NSString stringWithFormat:@"%02ld:%02ld/%ld播放",[video.length integerValue]/60,[video.length integerValue]%60,[video.playCount integerValue]];
}
//点击评论
- (IBAction)comment:(UIButton *)sender
{
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"commentButton" object:nil];
    
}
//点击转发
- (IBAction)transmit:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"transmitButton" object:nil];
}


@end
