//
//  RootViewController.m
//  App
//
//  Created by 李文韬 on 16/1/19.
//  Copyright © 2016年 com.wentao. All rights reserved.
//

#import "RootViewController.h"
#import "RequestManager.h"
#import <SVProgressHUD.h>

@interface RootViewController ()

@end

@implementation RootViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [NotificationCenter addObserver:self selector:@selector(OutLogin:) name:@"OutLogin" object:nil]; //退出登陆通知
//    
//    [NotificationCenter addObserver:self selector:@selector(LoginSuccee:) name:@"LoginSuccee" object:nil]; //登陆成功
    
  
    [self setSVProgress];
    
//    [self CheckTheNetWorkStatu];

 

//    [SVProgressHUD show];
    
    
}

- (void)setSVProgress
{
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:183/255.0 green:78/255.0 blue:147/255.0 alpha:1]];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
}


//- (void)setMeanuVc
//{
//    if (_tabBarVc) return;
//    
//    NSArray *titleArr = @[@"报表",@"停车",@"我的建筑"];
//    
//    ChartsViewController *parkVC = [[ChartsViewController alloc] init];
//    ParkViewController *payVc = [[ParkViewController alloc] init];
//    BuildingViewController *selfVc = [[BuildingViewController alloc] init];
//    
//    NSMutableArray *vcArr = [[NSMutableArray alloc] initWithObjects:parkVC,payVc,selfVc,nil];
//    
//    for (int i = 0; i < 3;  i++)
//    {
//        BaseViewController *vc = (BaseViewController *)vcArr[i];
//        vc.notNavBar = YES;
//        UITabBarItem *item = [[UITabBarItem alloc] init];
//        NSString *nor_str = [NSString stringWithFormat:@"tabbar_item%d_nor",i+1];
//        NSString *sel_str = [NSString stringWithFormat:@"tabbar_item%d_sel",i+1];
//        UIImage *nor_image = [[UIImage imageNamed:nor_str] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        UIImage *sel_image = [[UIImage imageNamed:sel_str] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [item setTitle:titleArr[i]];
//        item.image = nor_image;
//        item.selectedImage = sel_image;
//        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TextColor_Yellow,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TextColor_BLACK,NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
//        vc.tabBarItem = item;
//    }
//    
//    _tabBarVc = [[UITabBarController alloc] init];
//    _tabBarVc.viewControllers = vcArr;
//    [self addChildViewController:_tabBarVc];
//    [self.view addSubview:_tabBarVc.view];
//    _tabBarVc.selectedIndex = 0;
//    _tabBarVc.view.alpha = 0;
//    [UIView animateWithDuration:0.5 animations:^{
//        _tabBarVc.view.alpha = 1;
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//}

//- (void)setLoginVC
//{
//    
//    LoginViewController * loginVc = [[LoginViewController alloc] init];
//    loginVc.notNavBar = YES;
//    _loginNav = [[UINavigationController alloc] initWithRootViewController:loginVc];
//    _loginNav.navigationController.navigationBarHidden = YES;
//    _loginNav.view.frame = SCREEN_BOUNDS;
//    [self addChildViewController:_loginNav];
//    [self.view addSubview:_loginNav.view];
//    
//}

//#pragma mark - NSNotificationCenter
//
//- (void)OutLogin:(NSNotification *)notification
//{
//    
//    if (_loginNav) return;
//    
//    [self.navigationController popToRootViewControllerAnimated:NO];
//    
//    LoginViewController * loginVc = [[LoginViewController alloc] init];
//    loginVc.notNavBar = YES;
//    _loginNav = [[UINavigationController alloc] initWithRootViewController:loginVc];
//    _loginNav.navigationController.navigationBarHidden = YES;
//    _loginNav.view.frame = SCREEN_BOUNDS;
//    _loginNav.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
//    [self addChildViewController:_loginNav];
//    [self.view addSubview:_loginNav.view];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        _loginNav.view.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        if (_tabBarVc)
//        {
//            [UserManager autoLogin:NO];
//            [_tabBarVc.view removeFromSuperview];
//            _tabBarVc = nil;
//        }
//    }];
//}
//
//
//- (void)LoginSuccee:(NSNotification *)notification
//{
//    
//    if (!_loginNav) return;
//    [self setMeanuVc];
//    [UIView animateWithDuration:0.3 animations:^{
//        _loginNav.view.alpha = 0;
//    } completion:^(BOOL finished) {
//        [_loginNav.view removeFromSuperview];
//        [_loginNav removeFromParentViewController];
//        _loginNav = nil;
//    }];
//}


/**
 *  检查网络状态
 */
//- (void)CheckTheNetWorkStatu
//{
//    
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        
//        NSString *status_str = nil;
//        
//        switch (status)
//        {
//            case AFNetworkReachabilityStatusUnknown:status_str = @"未知网络状态";break;
//            case AFNetworkReachabilityStatusNotReachable:status_str = @"当前网络不可用";break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:status_str = @"WIFI状态";break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:status_str = @"流量状态";break;
//                
//                
//        }
//        
//        [MBProgressHUD bwm_showTitle:status_str toView:self.view hideAfter:1.5];
//        
//    }];
//    
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//
//}


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
