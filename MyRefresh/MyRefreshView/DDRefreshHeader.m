//
//  DDRefreshHeader.m
//  MyRefresh
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DDRefreshHeader.h"

@implementation DDRefreshHeader
-(void)prepare{
    [super prepare];
    self.lastUpdatedTimeLabel.hidden = YES;

    //[self setTitle:@"赶紧刷新吧..." forState:MJRefreshStateIdle];
    self.stateLabel.hidden =YES;

    
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=25; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"spinner_loop_%2d.png",i]];
        if (image) {
            [idleImages addObject:image];
            
        }
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=25; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"spinner_loop_%2d.png", i]];
        if (!(image == nil)) {
            [refreshingImages addObject:image];
        
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
}
}

@end
