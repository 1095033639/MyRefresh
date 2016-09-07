//
//  DDTableViewController.m
//  MyRefresh
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DDTableViewController.h"
#import "DDRefreshHeader.h"
#import "DDRefreshFooter.h"



static const CGFloat MJDuration = 2.0;
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface DDTableViewController ()

/** 用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *data;


@end

@implementation DDTableViewController


- (NSMutableArray *)data
{
    if (!_data) {
        self.data = [NSMutableArray array];
        for (int i = 0; i<5; i++) {
            [self.data addObject:MJRandomData];
        }
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.tableView  = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds  style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"refresh"];
    [self setupRefresh];

}

-(void)setupRefresh{
     __unsafe_unretained UITableView *tableView = self.tableView;
    self.tableView.mj_header = [DDRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 结束刷新
        [tableView.mj_header endRefreshing];
        
});
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    tableView.mj_footer = [DDRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

}
-(void)loadNewData{
    NSLog(@"刷新");
    __weak UITableView *tableView = self.tableView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [tableView.mj_header endRefreshing];
            
        });
   
}



-(void)loadMoreData{
    NSLog(@"上拉刷新");
    
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [tableView.mj_footer endRefreshing];
    });
    

}
#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 2;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"refresh";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
 
    cell.textLabel.text = @"测试";
    cell.detailTextLabel.text = @"可以";
   
    return cell;
}



@end
