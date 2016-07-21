//
//  xinlangCell.h
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xinlang.h"

@interface xinlangCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;


@property (weak, nonatomic) IBOutlet UILabel *imageName;

@property(nonatomic,strong)xinlang  *xin;

@end
