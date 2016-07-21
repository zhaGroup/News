//
//  SmallLiveTableViewCell.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SmallLiveTableViewCell.h"
#import <UIImageView+AFNetworking.h>
@implementation SmallLiveTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setSmall:(smallLive *)small
{
    _small=small;
    
    self.titleLabel.text=_small.title;
    
    self.sourceLabel.text=_small.source;
    self.startTimeLabel.text=_small.startTime;
    
    [self.imageV setImageWithURL:[NSURL URLWithString:_small.imageUrl]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
