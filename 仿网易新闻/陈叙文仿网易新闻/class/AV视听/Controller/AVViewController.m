//
//  AVViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AVViewController.h"
#import "VideoViewController.h"
#import "LiveViewController.h"

#import "transmitViewController.h"
@interface AVViewController ()<UIScrollViewDelegate,UIPopoverPresentationControllerDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UISegmentedControl  *segmented;
@end

@implementation AVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title=nil;
    
    self.segmented=[[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 100, 35)];
    self.navigationItem.titleView=self.segmented;
    
    [self.segmented insertSegmentWithTitle:@"视频" atIndex:0 animated:YES];
    
    [self.segmented insertSegmentWithTitle:@"直播" atIndex:1 animated:YES];
    
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
    
    self.scrollView.contentSize=CGSizeMake(KDSW*2, 0);

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
    VideoViewController *video=[[VideoViewController alloc]init];
    [self addChildViewController:video];
    
    
    LiveViewController *live=[[LiveViewController alloc]init];
    
    [self addChildViewController:live];
    
    
}

//点击segment改变下面的View
-(void)segmentedButtonClick:(UISegmentedControl*)seg
{
    if (seg.selectedSegmentIndex==0)
    {
        
        self.scrollView.contentOffset=CGPointMake(0, 0);
    }
    else
    {
        NSLog(@"直播");
        
        self.scrollView.contentOffset=CGPointMake(KDSW, 0);
    }
    
    [self showChildControlWithInteger:seg.selectedSegmentIndex];
    
}


-(void)showChildControlWithInteger:(NSInteger)inter
{
    if (inter==0)
    {
        VideoViewController *video=self.childViewControllers[0];
        
        video.view.frame=CGRectMake(0, 0, KDSW, KDSH-112);
        
        [self.scrollView addSubview:video.view];
    }
    else
    {
        LiveViewController *live=self.childViewControllers[1];
        
        live.view.frame=CGRectMake(KDSW, 0, KDSW, KDSH-112);
        
        [self.scrollView addSubview:live.view];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
