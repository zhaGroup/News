//
//  KRQuestionCell.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KrQuestion.h"

@interface KRQuestionCell : UITableViewCell


@property(nonatomic,strong)KrQuestion  *question;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *aliasLabel;

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@property (weak, nonatomic) IBOutlet UIImageView *HeadImageV;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *classificationLabel;


@property (weak, nonatomic) IBOutlet UILabel *concernLabel;

@property (weak, nonatomic) IBOutlet UILabel *questionCountLabel;


@end
