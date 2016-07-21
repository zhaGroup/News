//
//  SmallLiveTableViewCell.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smallLive.h"
@interface SmallLiveTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;

@property(nonatomic,strong)smallLive *small;
@end
