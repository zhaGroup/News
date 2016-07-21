//
//  TopViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TopViewController.h"

#import "KRQuestionViewController.h"
#import "KRTopicViewController.h"
#import "AttentionViewController.h"


@interface TopViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UISegmentedControl  *segmented;
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=nil;
    
    self.segmented=[[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    self.navigationItem.titleView=self.segmented;
    
    [self.segmented insertSegmentWithTitle:@"问吧" atIndex:0 animated:YES];
    
    [self.segmented insertSegmentWithTitle:@"话题" atIndex:1 animated:YES];
    
    [self.segmented insertSegmentWithTitle:@"关注" atIndex:2 animated:YES];
    
    [self.segmented  addTarget:self action:@selector(segmentedButtonClick:) forControlEvents:UIControlEventValueChanged ];
    
    //添加子控制器
    [self addChildViewControllerBB];
    //添加滚动视图
    [self addScrollViewBB];
    
    self.segmented.selectedSegmentIndex=0;
    [self segmentedButtonClick:self.segmented];
    
    
    
}
//添加滚动视图
-(void)addScrollViewBB
{
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, KDSW, KDSH-112)];
    
    self.scrollView.contentSize=CGSizeMake(KDSW*3, 0);
    
    self.scrollView.pagingEnabled=YES;
    
    self.scrollView.delegate=self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.scrollView];
}

//下面滚动视图滚动完成后
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger integer=scrollView.contentOffset.x/KDSW;
    
    self.segmented.selectedSegmentIndex=integer;
    
    
    [self segmentedButtonClick:self.segmented];
}

//添加自控制器
-(void)addChildViewControllerBB
{
    KRQuestionViewController *qustion=[[KRQuestionViewController alloc]init];
    [self addChildViewController:qustion];
    
    
    KRTopicViewController *topic=[[KRTopicViewController alloc]init];
    
    [self addChildViewController:topic];
    
    AttentionViewController  *attention=[[AttentionViewController alloc]init];
    
    [self addChildViewController:attention];
    
    
}

//点击segment改变下面的View
-(void)segmentedButtonClick:(UISegmentedControl*)seg
{
    
        
    self.scrollView.contentOffset=CGPointMake(KDSW*seg.selectedSegmentIndex, 0);
   
    
    [self showChildControlWithInteger:seg.selectedSegmentIndex];
    
}


-(void)showChildControlWithInteger:(NSInteger)inter
{
    if (inter==0)
    {
        KRQuestionViewController *qustion=self.childViewControllers[0];
        
        qustion.view.frame=CGRectMake(0, 0, KDSW, KDSH-112);
        
        [self.scrollView addSubview:qustion.view];
    }
    else if (inter==1)
    {
        KRTopicViewController *topic=self.childViewControllers[1];
        
        topic.view.frame=CGRectMake(KDSW, 0, KDSW, KDSH-112);
        
        [self.scrollView addSubview:topic.view];
    }
    else
    {
        AttentionViewController *attention=self.childViewControllers[2];
        
        attention.view.frame=CGRectMake(KDSW*2, 0, KDSW, KDSH-112);
        
        [self.scrollView addSubview:attention.view];
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
