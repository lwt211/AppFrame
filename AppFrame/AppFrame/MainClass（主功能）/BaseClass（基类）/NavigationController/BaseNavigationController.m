//
//  BaseNavigationController.m
//  App
//
//  Created by 李文韬 on 16/1/14.
//  Copyright © 2016年 com.wentao. All rights reserved.
//

#import "BaseNavigationController.h"

#define CustomNavigationBar





@interface BaseNavigationController ()<UIGestureRecognizerDelegate>
{
    UIPanGestureRecognizer *_popRecognizer;
}
@end

@implementation BaseNavigationController


@synthesize panPopGestureEnable = _panPopGestureEnable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
//    self.navigationBar.tintColor = Tint_Color;
//    self.navigationBar.barTintColor = Bar_Color;
    self.navigationBar.translucent = NO;
    self.navigationBar.barStyle = UIBarStyleDefault;
    
#ifdef CustomNavigationBar
    
//    [self.navigationBar setTitleTextAttributes:
//     
//     @{NSFontAttributeName:Title_Font,
//       
//       NSForegroundColorAttributeName:Title_Color}];
//    
//    if (BG_Image.length > 0)
//    {
//        [self.navigationBar setBackgroundImage:[UIImage imageNamed:BG_Image] forBarMetrics:UIBarMetricsCompact];
//    }

#endif
    
    
}


#pragma mark - 全屏滑动

- (void)setPanPopGestureEnable:(BOOL)panPopGestureEnable
{
    _panPopGestureEnable = panPopGestureEnable;
    
    //是否支持全屏拖动
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView *gestureView = gesture.view;
    

    if (_panPopGestureEnable)
    {
        _popRecognizer  = [[UIPanGestureRecognizer alloc] init];
        _popRecognizer.delegate = self;
        _popRecognizer.maximumNumberOfTouches = 1;
        [gestureView addGestureRecognizer:_popRecognizer];
        
        id target = self.interactivePopGestureRecognizer.delegate;
        
        SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
        
        [_popRecognizer addTarget:target action:handleTransition];
        
        
    }else
    {
        if (_popRecognizer)
        {
            [gestureView removeGestureRecognizer:_popRecognizer];
        }
    }
}

- (BOOL)panPopGestureEnable
{
    return _panPopGestureEnable;
}

#pragma mark - UIGestureRecognizerDelegate


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；
     */
    return self.viewControllers.count != 1;
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
