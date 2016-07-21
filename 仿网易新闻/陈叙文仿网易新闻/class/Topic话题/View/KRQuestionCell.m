//
//  KRQuestionCell.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "KRQuestionCell.h"
#import <UIImageView+AFNetworking.h>

@implementation KRQuestionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setQuestion:(KrQuestion *)question
{
    _question=question;
    self.nameLabel.text=_question.name;
    self.aliasLabel.text=_question.alias;
   
    
    
    
    [self.HeadImageV setImageWithURL:[NSURL URLWithString:_question.headpicurl]];
    
    self.HeadImageV.layer.cornerRadius=self.HeadImageV.bounds.size.width*0.5;
    
    self.HeadImageV.clipsToBounds=YES;
    
    
    self.HeadImageV.layer.borderWidth = 3.0f;
    self.HeadImageV.layer.borderColor = [UIColor whiteColor].CGColor;
    
     [self.picImageView setImageWithURL:[NSURL URLWithString:_question.picurl]];
    
    self.titleLabel.text=_question.title;
    
    self.classificationLabel.text=_question.classification;
    
    self.concernLabel.text=[NSString stringWithFormat:@"%@关注",[self byOldData:_question.concernCount]];
    
    
    
    self.questionCountLabel.text=[NSString stringWithFormat:@"%@提问",[self byOldData:_question.questionCount]];
    
    
    
    
}

-(NSString*)byOldData:(NSNumber*)number
{
    if ([number intValue]<10000)
    {
        return [NSString stringWithFormat:@"%@",number];
    }
    else
    {
        return  [NSString stringWithFormat:@"%.1f万",[number floatValue]/10000];
    }
    
}



@end
