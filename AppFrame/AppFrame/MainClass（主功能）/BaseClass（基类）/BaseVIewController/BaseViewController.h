//
//  BaseViewController.h
//  App
//
//  Created by 李文韬 on 16/1/14.
//  Copyright © 2016年 com.wentao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController
{
     UIView *_clearView; //透明蒙版
}

@property (nonatomic,strong) UIView *clearView; //透明蒙版

@property (nonatomic,readwrite) BOOL backBtnHidden;//隐藏返回按钮



//添加右按钮
- (void)setRightBtnWithTitle:(NSString *)title image:(UIImage *)image;
- (void)rightBtnClick;

- (void)ShowClearView; //显示蒙版
- (void)HiddenClearView; //隐藏蒙版
- (void)TapClearView; //点击蒙版





@end
