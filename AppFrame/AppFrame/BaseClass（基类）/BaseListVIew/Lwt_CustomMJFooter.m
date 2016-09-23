//
//  Lwt_CustomMJFooter.m
//  tableViewDemo
//
//  Created by 李文韬 on 16/3/25.
//  Copyright © 2016年 com.lightcar. All rights reserved.
//

#import "Lwt_CustomMJFooter.h"

@interface Lwt_CustomMJFooter ()
{
}

@property (weak, nonatomic) UIActivityIndicatorView *loading;

@end

@implementation Lwt_CustomMJFooter

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）

- (void)prepare
{
    [super prepare];
    
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loading.color = [UIColor orangeColor];
    [self addSubview:loading];
    self.loading = loading;
}

#pragma mark 在这里设置子控件的位置和尺寸

- (void)placeSubviews
{
    [super placeSubviews];
    
    self.loading.center = CGPointMake(self.mj_w/2.0, self.mj_h/2.0-7);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            [self.loading stopAnimating];
            break;
        case MJRefreshStatePulling:
            [self.loading startAnimating];
            break;
        case MJRefreshStateRefreshing:
            [self.loading startAnimating];
            break;
        case MJRefreshStateNoMoreData:
            [self.loading stopAnimating];
        default:
            break;
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
