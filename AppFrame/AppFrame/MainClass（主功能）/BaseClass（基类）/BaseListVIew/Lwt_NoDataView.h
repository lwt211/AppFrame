//
//  Lwt_NoDataView.h
//  tableViewDemo
//
//  Created by 李文韬 on 16/3/24.
//  Copyright © 2016年 com.lightcar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lwt_NoDataView : UIView

@property (nonatomic,readonly) UIImageView *imageView; //图片

@property (nonatomic,readonly) UILabel *descriptionLabel;; //提示语句

@property (nonatomic,readonly) UIButton *refreshButton; //刷新按钮

@property (nonatomic,copy) void (^clickBlock)(void);


- (void)refreshButtomClick:(void(^)(void))clickBlock;


- (instancetype)initWithFrame:(CGRect)frame withAddRefreshButton:(BOOL)addRefreshButton description:(NSString*)description;


@end
