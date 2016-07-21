//
//  xinlangCell.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "xinlangCell.h"

@implementation xinlangCell

- (void)awakeFromNib {

   

}




-(void)setXin:(xinlang *)xin
{
    _xin=xin;
    self.imageName.text=_xin.labelName;
    self.imageV.image=[UIImage imageNamed:_xin.imageName];
}
@end
