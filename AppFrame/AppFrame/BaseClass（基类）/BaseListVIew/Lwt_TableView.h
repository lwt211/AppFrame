//
//  Lwt_TableView.h
//  tableViewDemo
//
//  Created by 李文韬 on 16/3/24.
//  Copyright © 2016年 com.lightcar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"




typedef NS_ENUM(NSInteger,GetDataStatu)  //此时获取数据的状态
{
  
    DownRefreshStatu = 0, //下拉刷新
    UpLoadMore, //上拉加载
};


typedef void (^getNewDataBlock)();



@interface Lwt_TableView : UITableView


@property (nonatomic,readwrite) BOOL addUpLoadMore; //是否添上啦加载更多

@property (nonatomic,readwrite) NSInteger totalNum; //总条数

@property (nonatomic,readonly) NSInteger requestPage; //请求页码

@property (nonatomic,readonly) NSInteger currentPage; //当前页码

@property (nonatomic,readonly) GetDataStatu getDataStatu; //当前获取数据的状态




/**
 *  停止刷新
 */
- (void)stopRefresh;


/**
 *  获取新数据
 *
 *  @param getDataStatu 获取数据方式
 */

- (void)getNewData:(getNewDataBlock)getDataStatuBlock;


/**
 *  弹出无数据提示框
 *
 *  @param actStr 提示语句
 *  @param addRefrshBtn 是否添加点击刷新按钮
 */
- (void)showNoDataView:(NSString *)actStr addRefrshBtn:(BOOL)addRefrshBtn;


/**
*  上拉加载成功
*/
- (void)UpLoadMoreSuccesd;
















/**
     示例
 *  //请求成功后
 [_tableView stopRefresh];
 
 if (_tableView.getDataStatu == DownRefreshStatu)
 {
 _tableView.totalNum = [[result objectForKey:@"total"] integerValue];
 [_dataArr removeAllObjects];
 }
 
 for (NSDictionary *subInfo in [result objectForKey:@"rows"])
 {
 CouponsModel *model = [[CouponsModel alloc] initWithDic:subInfo];
 [_dataArr addObject:model];
 }
 
 [_tableView reloadData];
 
 if (_dataArr.count == 0)
 {
 [_tableView showNoDataView:@"暂时没有更多的优惠券，赶紧添加喔~" addRefrshBtn:YES];
 }
 
 if (_tableView.getDataStatu == UpLoadMore)
 {
 [_tableView UpLoadMoreSuccesd];
 }
 
 
  //失败后
 
 [_tableView stopRefresh];
 
 [_tableView showNoDataView:@"网络错误，刷新一下试试呗~" addRefrshBtn:YES];

 

 */


@end
