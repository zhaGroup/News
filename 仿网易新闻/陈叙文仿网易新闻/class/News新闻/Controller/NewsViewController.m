//
//  NewsViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsListViewController.h"


@interface NewsViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *titleScrollView;

@property(nonatomic,strong)UIScrollView *contentScrollView;

@property(nonatomic,strong)NSMutableArray *buttonTitleArray;

@property(nonatomic,strong)NSMutableArray *titleArray;

//声明临时按钮
@property(nonatomic,strong)UIButton *tempButton;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonTitleArray=[NSMutableArray array];
    
    self.titleArray=[NSMutableArray array];
    //添加子视图控制器
    [self addChildViewControllers];
    
    //添加内容滚动视图
    
    [self addContentScrollViewBB];
    //添加标题滚动视图
    [self addTitleScrollViewBB];
    //添加标题按钮
    [self addTitleButton];
    
    
    [self buttonClick:self.buttonTitleArray[0]];

    
}
//添加标题滚动视图
-(void)addTitleScrollViewBB
{
    self.titleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, KDSW, 36)];
    
    self.titleScrollView.contentSize=CGSizeMake(self.childViewControllers.count*KDSW/4, 0);
    
    [self.view addSubview:self.titleScrollView];
    
//    self.titleScrollView.backgroundColor=[UIColor yellowColor];
}
//添加标题按钮
-(void)addTitleButton
{
    for (int i=0; i<self.childViewControllers.count; i++)
    {
        
        UIViewController *vc=self.childViewControllers[i];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];

        button.tag=i;
        button.frame=CGRectMake(i*KDSW/4, 0, KDSW/4, 36);
        
        [button setTitle:vc.title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.buttonTitleArray addObject:button];
        [self.titleScrollView addSubview:button];
    }
    
}
//点击标题按钮事件
-(void)buttonClick:(UIButton*)sender
{
    self.tempButton.selected=NO;
    self.tempButton.transform= CGAffineTransformMakeScale(1.0, 1.0);
    
    sender.selected=YES;
    sender.transform = CGAffineTransformMakeScale(1.3, 1.3);
    
    self.tempButton=sender;
    self.contentScrollView.contentOffset=CGPointMake(KDSW*sender.tag, 0);
    
      [self showChildViewWithIndex:sender.tag];
    CGFloat OffSetX=0;
    if (sender.center.x<KDSW/2)
    {
        OffSetX=0;
    }
    else if ((self.titleScrollView.contentSize.width-sender.center.x)<KDSW/2)
    {
        OffSetX=self.titleScrollView.contentSize.width-KDSW;
    }
    else
    {
        OffSetX=sender.center.x-KDSW/2;
    }
    self.titleScrollView.contentOffset=CGPointMake(OffSetX, 0);
    
  
    
}


//添加子视图
-(void)addChildViewControllers
{
    NewsListViewController *HeadVc=[[NewsListViewController alloc]init];
    
    HeadVc.title=@"头条";
    HeadVc.dicKeyWord=@"T1348647853363";
    
    NewsListViewController *NBAVC=[[NewsListViewController alloc]init];
    
    NBAVC.title=@"娱乐";
    NBAVC.dicKeyWord=@"T1348648517839";
    
    NewsListViewController *PhoneVC=[[NewsListViewController alloc]init];
    
    PhoneVC.title=@"体育";
    PhoneVC.dicKeyWord=@"T1348649079062";
    
    NewsListViewController *MoveVc=[[NewsListViewController alloc]init];
    
    MoveVc.title=@"财经";
    MoveVc.dicKeyWord=@"T1348648756099";
    
    NewsListViewController *YuLeVC=[[NewsListViewController alloc]init];
    
    YuLeVC.title=@"科技";
    YuLeVC.dicKeyWord=@"T1348649580692";
    
    NewsListViewController *fashionVc=[[NewsListViewController alloc]init];
    
    fashionVc.title=@"军事";
    fashionVc.dicKeyWord=@"T1348648141035";
    

//    NewsListViewController *MovieVC=[[NewsListViewController alloc]init];
//    
//    MovieVC.title=@"家居";
//    MoveVc.dicKeyWord=@"T1348654105308";

    
    NewsListViewController *ScienceVC=[[NewsListViewController alloc]init];
    ScienceVC.title=@"历史";
    ScienceVC.dicKeyWord=@"T1368497029546";
    
    NewsListViewController *OnlyHome=[[NewsListViewController alloc]init];
    OnlyHome.title=@"独家";
    OnlyHome.dicKeyWord=@"T1370583240249";
    
    NewsListViewController *GameVc=[[NewsListViewController alloc]init];
    GameVc.title=@"游戏";
    GameVc.dicKeyWord=@"T1348654151579";
    
    NewsListViewController *HeathVc=[[NewsListViewController alloc]init];
    HeathVc.title=@"健康";
    HeathVc.dicKeyWord=@"T1414389941036";
    
    NewsListViewController *GovVC=[[NewsListViewController alloc]init];
    GovVC.title=@"政务";
    GovVC.dicKeyWord=@"T1414142214384";
    
    
    NewsListViewController *ComicVc=[[NewsListViewController alloc]init];
    ComicVc.title=@"漫画";
    ComicVc.dicKeyWord=@"T1444270454635";
    
    NewsListViewController *IntestVC=[[NewsListViewController alloc]init];
    IntestVC.title=@"哒哒趣闻";
    IntestVC.dicKeyWord=@"T1444289532601";
    
    NewsListViewController *TicketVc=[[NewsListViewController alloc]init];
    TicketVc.title=@"彩票";
    TicketVc.dicKeyWord=@"T1356600029035";
    
    

    [self addChildViewController:HeadVc];
    [self addChildViewController:NBAVC];
    [self addChildViewController:PhoneVC];
    [self addChildViewController:MoveVc];
    [self addChildViewController:YuLeVC];
    [self addChildViewController:fashionVc];
//    [self addChildViewController:MovieVC];
    [self addChildViewController:ScienceVC];
    
     [self addChildViewController:OnlyHome];
     [self addChildViewController:GameVc];
     [self addChildViewController:HeathVc];
     [self addChildViewController:GovVC];
     [self addChildViewController:ComicVc];
     [self addChildViewController:IntestVC];
     [self addChildViewController:TicketVc];
    
    
    
    
   
}

-(void)addContentScrollViewBB
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, KDSW, KDSH-100)];
    
    self.contentScrollView.contentSize=CGSizeMake(self.childViewControllers.count*KDSW, 0);
    
    self.contentScrollView.delegate=self;
    self.contentScrollView.pagingEnabled=YES;
    
    
 
    [self.view addSubview:self.contentScrollView];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page=scrollView.contentOffset.x/KDSW;
    
    UIButton *button=self.buttonTitleArray[page];
    NSLog(@"%ld",page);
    
    [self buttonClick:button];
}

-(void)showChildViewWithIndex:(NSInteger)index
{
    NewsListViewController *list=(NewsListViewController *)self.childViewControllers[index];
    

    
    if (!list.view.window)
    {
        list.view.frame=CGRectMake(KDSW*index, 0, KDSW, KDSH-112);
        
        [self.contentScrollView addSubview:list.view];
    }
    
    
    //添加左右控制器
    if (index==0)
    {
        NewsListViewController *right=(NewsListViewController *)self.childViewControllers[index+1];
        right.view.frame=CGRectMake(KDSW*(index+1), 0, KDSW, KDSH-112);
        
        [self.contentScrollView addSubview:right.view];
        
    }
    
    else if (index==self.childViewControllers.count-1)
        
    {
        NewsListViewController *left=(NewsListViewController *)self.childViewControllers[index-1];
        left.view.frame=CGRectMake(KDSW*(index-1), 0, KDSW, KDSH-112);
        
        [self.contentScrollView addSubview:left.view];
    }
    else
    {
        NewsListViewController *left=(NewsListViewController *)self.childViewControllers[index-1];
        left.view.frame=CGRectMake(KDSW*(index-1), 0, KDSW, KDSH-112);
        
        [self.contentScrollView addSubview:left.view];
        
        NewsListViewController *right=(NewsListViewController *)self.childViewControllers[index+1];
        right.view.frame=CGRectMake(KDSW*(index+1), 0, KDSW, KDSH-112);
        
        [self.contentScrollView addSubview:right.view];
        
    }
    
    //最多只存在5个自控制器 优化内存
    for (int i=0; i<self.childViewControllers.count; i++)
    {
         NewsListViewController *Vc=(NewsListViewController *)self.childViewControllers[i];
        
        if (fabs((double)(i-index)) > 2 && Vc.isViewLoaded) {
            [Vc.view removeFromSuperview];
        }
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
