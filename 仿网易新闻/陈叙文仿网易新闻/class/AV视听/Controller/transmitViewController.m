//
//  transmitViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "transmitViewController.h"
#import "xinlangCell.h"
#import "xinlang.h"
#import "modelManager.h"


#import "UIViewController+STPopup.h"
@interface transmitViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView  *collectionView;

@property(nonatomic,strong)NSArray *shareArray;
@end

@implementation transmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.shareArray=[modelManager getAllShare];
    
    [self addOther];
    
    //第三方方法
    self.contentSizeInPopup = CGSizeMake(340, 400);
//    self.landscapeContentSizeInPopup = CGSizeMake(600, 200);
    
    UICollectionViewFlowLayout  *fl=[[UICollectionViewFlowLayout alloc]init];
    fl.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled=YES;
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, 340, 180) collectionViewLayout:fl];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"xinlangCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
//    self.view.backgroundColor=[UIColor yellowColor];

}


-(void)addOther
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(8, 8, 80, 20)];
    label.text=@"分享领红包 ?";
    label.font=[UIFont systemFontOfSize:12];
    label.textColor=[UIColor redColor];
    
    [self.view addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(self.view.frame.size.width*0.5-20, self.view.frame.size.height-60, 40, 40);
    
    
    button.frame=CGRectMake(130,250, 50, 50);

    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
  
    [self.view addSubview:button];
}

-(void)buttonClick
{
   
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shareArray.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    xinlangCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.xin = self.shareArray[indexPath.row];
    
    cell.backgroundColor=[UIColor redColor];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}
@end
