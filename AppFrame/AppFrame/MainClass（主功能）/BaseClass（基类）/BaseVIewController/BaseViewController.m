//
//  BaseViewController.m
//  App
//
//  Created by 李文韬 on 16/1/14.
//  Copyright © 2016年 com.wentao. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BASEBG_COLOR;
    
    [self setBackBtn];

}

- (void)setBackBtn
{
    // 设置返回按钮的文本
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@""
                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    // 设置返回按钮的背景图片
    UIImage *img = [UIImage imageNamed:@"navbar_back"];
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:img
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
//     设置文本与图片的偏移量
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 0)
                                                             forBarMetrics:UIBarMetricsDefault];
//     设置文本的属性
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:21], NSForegroundColorAttributeName:[UIColor blackColor]};
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
}

- (void)setRightBtnWithTitle:(NSString *)title image:(UIImage *)image
{
    UIBarButtonItem *rightButton = nil;
    
    // 设置返回按钮的文本
    if (title&&title.length > 0)
    {
       rightButton = [[UIBarButtonItem alloc]
                                        initWithTitle:title
                                        style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    }
    
    if (image)
    {
        rightButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    }
    
    [self.navigationItem setRightBarButtonItem:rightButton];
    
}


- (void)rightBtnClick
{
    NSLog(@"rightBtnClick");
}


- (void)ShowClearView //显示蒙版
{
    if (!_clearView)
    {
        _clearView = [[UIView alloc] initWithFrame:SCREEN_BOUNDS];
        _clearView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapClearView)];
        [_clearView addGestureRecognizer:tap];
        [self.view addSubview:_clearView];
    }else
    {
        [self.view bringSubviewToFront:_clearView];
    }
    
}

- (void)HiddenClearView //隐藏蒙版
{
    [_clearView removeFromSuperview];
    _clearView = nil;
}



//点击蒙版

- (void)TapClearView
{
    
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


