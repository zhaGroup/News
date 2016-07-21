//
//  KRQuestionViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "KRQuestionViewController.h"
#import "NetManager.h"
#import "KrQuestion.h"
#import "KRQuestionCell.h"
#import <MJRefresh.h>
@interface KRQuestionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *questionArray;
@property(nonatomic,assign)NSInteger count;


@property(nonatomic,strong)UICollectionView *colletionView;
@end

@implementation KRQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionArray=[NSMutableArray array];
    
    self.count=0;
    
     self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KDSW, KDSH-112) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    
  
    
 

    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(topChangeData)];
    
    [self topChangeData];
    
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(bottonChangeData)];
    

    [self.tableView registerNib:[UINib nibWithNibName:@"KRQuestionCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

//上拉刷新
-(void)topChangeData
{
    self.count=0;
    [NetManager getQuestionWith:self.count andBlock:^(id obj) {
        //
        
        [self.questionArray removeAllObjects];
        [self.questionArray addObjectsFromArray:obj];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

//下拉刷新

-(void)bottonChangeData
{
    self.count++;
   
    [NetManager getQuestionWith:self.count andBlock:^(id obj) {
        //
         [self.questionArray addObjectsFromArray:obj];
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questionArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KRQuestionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell=[[KRQuestionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.question=self.questionArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 274;
}



#pragma collctionView  集合视图的办法



@end
