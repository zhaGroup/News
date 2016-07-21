//
//  VideoViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "NetManager.h"

#import "MyVideo.h"
#import "MyViewCell.h"

#import "VideoPlayViewController.h"

#import <MJRefresh.h>

#import "transmitViewController.h"


#import "STPopupController.h"



@interface VideoViewController ()<UITableViewDataSource,UITableViewDelegate,UIPopoverPresentationControllerDelegate>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSArray *keyWordArray;
@property(nonatomic,strong)NSMutableArray *videoArray;

@property(nonatomic,assign)NSInteger count;


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.keyWordArray=@[@"ts=1468288736&sign=I5braI5qfKqsNa3N6oCo8%2FqqdzuPq5jsQNPuOEAV1kN48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468288746&sign=H5%2FVmjKk4%2BMoZuTF%2Brb3Z202uFKOQZ9taEpkUNx82gl48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468289231&sign=74ojyd10Y3jQTGx7DODctrb%2BtI7czI91hiC3q7oCsgB48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468289259&sign=smAM2DVnNri%2F9WcYIbj0GhkoLh5psHh78Xe5AScAjzV48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468318995&sign=c2ecS046QR38v3PfebZdPV1AG3tZgQbrzy%2FQbA4OUbp48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324254&sign=zvt5b7ePBuaeCHCC6F8xW7w4jriCr5jyHVT%2B%2Bcv2DT548ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324479&sign=gapMM5mFB3gxsNcQyfY9DXWWUgPM6WltOEHHpVQTdzd48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324480&sign=zTHOVCS1H6Q9cMtuka%2FVgY9nk%2B10m0W6IvxnPG%2Bo7L948ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324548&sign=vC9AmHJK2ovATq7xVAJKCbBnJCRQ3c19ZiRpt0xDwFB48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324552&sign=E8UgAqwIQD94QISOyBEMU1SWSq%2FXdakzwbSlJ%2BgYn%2BZ48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324554&sign=W3euWCxLHIs0TMA73TnCZ37x3AayLy1IC1t89NQNXDR48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324556&sign=hLbjnfC1SeA04YISorEoIcX6g1L7BUSHS7Yzy8odbVp48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324559&sign=oY9DVYtXYEqyaeX4WCzUXQ8pmy8KcMoI5nYaAjrR5Th48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324561&sign=nLwlCT5eYPlEZPAKdLe1Gwj%2FvH%2BT4kXRva1nKSteRNt48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324565&sign=TXRQXP%2FpeK%2FAbmSoO25TIK7%2F8GNyVP0rpAQgBpoQNUN48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324571&sign=61xt%2FHULqyvHFmAW%2BZ0ZCNeDVu%2B5VTNulVHIai%2FFkXZ48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324574&sign=jAZbNLmBXEW9Fxs1fBnb7xYvMNN397KWl7%2Fr0MHKFKh48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324579&sign=w%2FaZfzzChw%2FkO2DEvAbsaY4DpXgudxnEKUKi73wx84V48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324579&sign=w%2FaZfzzChw%2FkO2DEvAbsaY4DpXgudxnEKUKi73wx84V48ErR02zJ6%2FKXOnxX046I"
                        ,@"ts=1468324584&sign=baFQ9qeUrt0B%2Bz4MEONxKDHXtAcWhAzjH96Ei0dcJ9N48ErR02zJ6%2FKXOnxX046I"];
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KDSW, KDSH-112) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
    self.videoArray=[NSMutableArray array];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(topChangeData)];
    
    [self topChangeData];
    
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(bottonChangeData)];
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toWebView:) name:@"commentButton" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transmitView:) name:@"transmitButton" object:nil];
    
    
   
   
}




//转发通知办法
-(void)transmitView:(NSNotification*)noti
{
   
    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:[transmitViewController new]];
    popupController.containerView.layer.cornerRadius = 4;
 
     popupController.transitionStyle = STPopupTransitionStyleFade;
    [popupController presentInViewController:self];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
        return UIModalPresentationNone ;
}
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return NO;   //点击蒙版popover不消失， 默认yes
}

-(void)toWebView:(NSNotification*)noti
{
    NSLog(@"comment被点击");
}


//上拉刷新
-(void)topChangeData
{
    self.count=0;
    [NetManager getVedioWithKeyWord:self.keyWordArray[self.count] andBlock:^(id obj) {
            //
            [self.videoArray removeAllObjects];
            [self.videoArray addObjectsFromArray:obj];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
    }];
    
}

//下拉刷新

-(void)bottonChangeData
{
    self.count++;
    if (self.count<20)
    {
        [NetManager getVedioWithKeyWord:self.keyWordArray[self.count] andBlock:^(id obj) {
            //
            [self.videoArray addObjectsFromArray:obj];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }];
    }
  
}

#pragma mark ---tableView方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videoArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.video=self.videoArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 217;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyVideo *video=self.videoArray[indexPath.row];
    
    VideoPlayViewController  *play=[[VideoPlayViewController alloc]init];
    
    play.url=video.mp4_url;
    [self.navigationController pushViewController:play animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
