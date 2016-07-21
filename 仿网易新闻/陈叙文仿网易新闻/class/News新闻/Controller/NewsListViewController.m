//
//  NewsListViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsListViewController.h"
#import "NetManager.h"

#import "NewsCell.h"

#import "KNBannerView.h"

#import "NSData+KNCache.h"

#import "MyAds.h"

#import "Mynews.h"

#import "NewDetailViewController.h"

#import <MJRefresh.h>
@interface NewsListViewController ()<UITableViewDataSource,UITableViewDelegate,KNBannerViewDelegate>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIScrollView *scrollView;


@property(nonatomic,strong)NSArray *adsArray;

@property(nonatomic,strong)NSArray  *newsArray;


@property(nonatomic,strong)NSMutableArray *allAdsArray;

@property(nonatomic,strong)NSMutableArray  *allNewSArray;

@property(nonatomic,assign)NSInteger count;
@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//设置初始frame
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, -36, KDSW, KDSH) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate=self;
    
    self.tableView.dataSource=self;
    
    self.count=0;
    
    self.allAdsArray=[NSMutableArray array];
    
    self.allNewSArray=[NSMutableArray array];
    
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(topChangeData)];
    
    [self topChangeData];
    
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(bottonChangeData)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    self.tableView.backgroundColor=[UIColor greenColor];
    

}
//上拉刷新
-(void)topChangeData
{
    self.count=0;
    [ NetManager  getTouTiaoDataWithParameter:self.count andTitle:self.dicKeyWord  andBlcok:^(NSArray *obj1, NSArray *obj2) {
        //
        if (obj1 )
        {
            [self.allAdsArray removeAllObjects];
            
            [self.allAdsArray addObjectsFromArray:obj1];
//            self.adsArray=obj1;
            //设置轮播图
            [self setupNetWorkBannerView];
            
            self.tableView.frame=self.view.bounds;
        }
        
        //根据有无表头重新设定frame
        if (!obj1)
        {
            self.tableView.tableHeaderView=nil;
            
            self.tableView.frame=CGRectMake(0, -36, KDSW, KDSH-78);
        }
        [self.allNewSArray  removeAllObjects];
        
        [self.allNewSArray  addObjectsFromArray:obj2];
        
//        self.newsArray=obj2;
        
        //加进去轮播图
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    }];
}

//下拉刷新

-(void)bottonChangeData
{
    self.count++;
    [ NetManager  getTouTiaoDataWithParameter:self.count andTitle:self.dicKeyWord  andBlcok:^(NSArray *obj1, NSArray *obj2) {

        [self.allNewSArray  addObjectsFromArray:obj2];
        //加进去轮播图
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
    }];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
}

//设置广告轮播图
- (void)setupNetWorkBannerView{
    NSMutableArray *imgArr = [NSMutableArray array];
    
    NSMutableArray *IntroduceArr = [NSMutableArray array];

    for (MyAds  *ads in self.allAdsArray)
    {
        NSString  *img=ads.imageUrl;
        
        [imgArr addObject:img];
        NSString  *string=ads.title;
        
        [IntroduceArr addObject:string];
    }
    
    // 设置 网络 轮播图
    KNBannerView *bannerView = [KNBannerView bannerViewWithNetWorkImagesArr:imgArr frame:CGRectMake(0, 64, self.view.width, 180)];
    bannerView.delegate = self;
    
    /****************************** == 描述文字 == ********************************/

    bannerView.IntroduceStringArr = IntroduceArr;
    /****************************** == 占位图 == ********************************/
    bannerView.placeHolder = @"3";
    bannerView.tag = 100;
//    [self.view addSubview:bannerView];
    
    self.tableView.tableHeaderView=bannerView;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return self.allNewSArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.news=self.allNewSArray[indexPath.row];
    
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 97;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Mynews  *news=self.allNewSArray[indexPath.row];
    
    NewDetailViewController   *detail=[[NewDetailViewController alloc]init];
    
    
    detail.url=news.url;
    if (detail.url)
    {
        [self.navigationController pushViewController:detail animated:YES];
    }
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
