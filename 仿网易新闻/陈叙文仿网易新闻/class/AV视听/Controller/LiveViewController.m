//
//  LiveViewController.m
//  陈叙文仿网易新闻
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveViewController.h"
#import "NetManager.h"

#import "liveSection.h"

#import "SmallLiveTableViewCell.h"

#import "liveHeadView.h"

#import <UIImageView+AFNetworking.h>
@interface LiveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;


@property(nonatomic,strong)NSArray *sectionArray;
@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KDSW, KDSH-112) style:UITableViewStyleGrouped];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    [self.view addSubview:self.tableView];
    
    [NetManager getLiveDataWithBlock:^(NSArray *obj1, NSArray *obj2) {
        //
        self.sectionArray=obj2;
        
        NSDictionary *dic= obj1[0];
       
        liveHeadView  *liveHead=[[NSBundle mainBundle]loadNibNamed:@"liveHeadView" owner:nil options:nil].lastObject;
        NSString *url=dic[@"imgsrc"];
        [liveHead.imageV  setImageWithURL:[NSURL URLWithString:url]];
        
        liveHead.titleLabel.text=dic[@"title"];
        
    
        [self.tableView reloadData];
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SmallLiveTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    liveSection *live=self.sectionArray[section];
    return live.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SmallLiveTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    liveSection *live=self.sectionArray[indexPath.section];
    
    cell.small=live.dataArray[indexPath.row];

   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
    
    CGRect frameRect = CGRectMake(0, 0, 100, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:frameRect];
    liveSection *live=self.sectionArray[section];
    label.backgroundColor=[UIColor whiteColor];
    label.text=live.title;
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGRect frameRect = CGRectMake(0, 0, 60, 40);
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frameRect;
    
    [button setTitle:@"查看更多" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    return button;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
