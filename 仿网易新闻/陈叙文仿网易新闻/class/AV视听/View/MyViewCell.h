//
//  MyViewCell.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyVideo.h"
@interface MyViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *playNumberLabel;


@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property(nonatomic,strong)MyVideo *video;

-(NSString*)getPlayNumberLabelTextWithVideo:(MyVideo*)video;
@end
