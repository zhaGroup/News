//
//  NewsCell.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsCell.h"
#import <UIImageView+AFNetworking.h>
@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setNews:(Mynews *)news
{
    _news=news;
    
    self.titleLabel.text=_news.title;
    self.sourceLabel.text=_news.source;
    
    [self.imageV setImageWithURL:[NSURL URLWithString:_news.imageURl]];
    
}
@end
