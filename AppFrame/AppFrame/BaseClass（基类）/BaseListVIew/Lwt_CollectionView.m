//
//  Lwt_CollectionView.m
//  shuangtu
//
//  Created by 李文韬 on 16/9/17.
//  Copyright © 2016年 TD_. All rights reserved.
//

#import "Lwt_CollectionView.h"
#import "Lwt_NoDataView.h"
#import "Lwt_CustomMJHeader.h"
#import "Lwt_CustomMJFooter.h"

@interface Lwt_CollectionView ()
{
    Lwt_NoDataView * _noDataView;//没有数据显示界面
    NSInteger _totalPage; //总页码
    NSInteger _nextPage ;//下一页
}

@property (nonatomic,copy) getNewDataBlock getNewDateBlock;

@property (nonatomic,readwrite) NSInteger requestPage; //请求页码

@property (nonatomic,readwrite) GetDataStatu getDataStatu;

@end

@implementation Lwt_CollectionView

@synthesize totalNum = _totalNum;

@synthesize getDataStatu = _getDataStatu;

@synthesize addUpLoadMore = _addUpLoadMore;

- (void)dealloc
{
    NSLog(@"Lwt_CollectionView  release");
    
    [_noDataView removeFromSuperview];
    _noDataView = nil;
}



- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self)
    {
        
        self.getDataStatu = DownRefreshStatu;
        
        Lwt_CustomMJHeader *header = [Lwt_CustomMJHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        self.mj_header =  header;
        
        
        Lwt_CustomMJFooter *footer = [Lwt_CustomMJFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        
        self.mj_footer = footer;
        
       
        

    }
    
    return self;
}

- (void)loadNewData
{
    self.getDataStatu = DownRefreshStatu;
    
    if (self.getNewDateBlock)
    {
        self.getNewDateBlock();
    }
    
}

- (void)loadMoreData
{
    
    self.getDataStatu = UpLoadMore;
    
    if ( self.getNewDateBlock)
    {
        self.getNewDateBlock();
    }
    
}


- (void)getNewData:(getNewDataBlock)getDataStatuBlock
{
    if (getDataStatuBlock)
    {
        self.getNewDateBlock = getDataStatuBlock;
    }
}

- (void)stopRefresh
{
    if (self.getDataStatu == DownRefreshStatu)
    {
        [self.mj_header endRefreshing];
    }else
    {
        [self.mj_footer endRefreshing];
    }
}

- (void)showNoDataView:(NSString *)actStr addRefrshBtn:(BOOL)addRefrshBtn
{
    if (_noDataView == nil)
    {
        _noDataView = [[Lwt_NoDataView alloc] initWithFrame:self.frame withAddRefreshButton:addRefrshBtn description:actStr];
        [self.superview addSubview:_noDataView];
        self.scrollEnabled = NO;
        [_noDataView refreshButtomClick:^{
            self.scrollEnabled = YES;
            _noDataView.hidden = YES;
            if (self.getDataStatu == DownRefreshStatu)
            {
                [self.mj_header beginRefreshing];
            }else
            {
                [self.mj_footer beginRefreshing];
            }
        }];
        
    }else
    {    self.scrollEnabled = NO;
        _noDataView.hidden = NO;
        _noDataView.refreshButton.hidden = !addRefrshBtn;
        _noDataView.descriptionLabel.text = actStr;
    }
    
}


/**
 *  上拉加载成功后
 */
- (void)UpLoadMoreSuccesd
{
    _currentPage = _nextPage;
    _nextPage = _currentPage+1;
    [self isLastPage];
}


/**
 *  计算总页码
 *
 *  @param totalNum 总条数
 */
- (void)setTotalNum:(NSInteger)totalNum
{
    _totalNum = totalNum;
    _totalPage = (_totalNum-1)/OnePageNum +1;
    
    [self isLastPage];
}

- (NSInteger)totalNum
{
    return _totalNum;
}

/**
 *  判断是否最后一页
 */
- (void)isLastPage
{
    if (_currentPage -FirstPage == _totalPage-1)
    {
        [self.mj_footer endRefreshingWithNoMoreData];
        self.mj_footer.hidden = YES;
    }
    
}


- (void)setGetDataStatu:(GetDataStatu)getDataStatu
{
    _getDataStatu = getDataStatu;
    
    if (self.getDataStatu == DownRefreshStatu)
    {
        self.requestPage = FirstPage;
        _currentPage = self.requestPage;
        if (_addUpLoadMore)
        {
            self.mj_footer.hidden = NO;
            [self.mj_footer resetNoMoreData];
        }
        
    }else
    {
        _nextPage = _currentPage+1;
        self.requestPage = _nextPage;
    }
    
}


- (GetDataStatu)getDataStatu
{
    return _getDataStatu;
}


/**
 *  设置是否添加上啦加载更多
 */
- (void)setAddUpLoadMore:(BOOL)addUpLoadMore
{
    _addUpLoadMore = addUpLoadMore;
    
    self.mj_footer.hidden = !_addUpLoadMore;
}

- (BOOL)addUpLoadMore
{
    return _addUpLoadMore;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
