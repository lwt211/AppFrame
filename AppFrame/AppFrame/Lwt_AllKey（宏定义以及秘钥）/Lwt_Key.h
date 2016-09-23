

//
//  Lwt_Key.h
//  个人常用有全局宏
//
//  Created by showsoft_004 on 15-3-6.
//  Copyright (c) 2015年 huhuaxiang. All rights reserved.
//



//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//判断手机型号
#define IS_IPhone4 ([[UIScreen mainScreen]bounds].size.height == 480)
#define IS_IPhone5 ([[UIScreen mainScreen]bounds].size.height == 568)
#define IS_IPhone6 ([[UIScreen mainScreen]bounds].size.height == 667)
#define IS_IPhone6_Plus ([[UIScreen mainScreen]bounds].size.height == 736)

//基本打印
#define DNSLogPoint(_POINT_)  NSLog(@" x == %f, y == %f", (_POINT_).x, (_POINT_).y)
#define DNSLogSize(_SIZE_)   NSLog(@" width == %f, height == %f",(_SIZE_).width, (_SIZE_).height)
#define DNSLogRect(_FRAME_)   NSLog(@" x == %f, y == %f, width == %f, height ==%f",(_FRAME_).origin.x, (_FRAME_).origin.y, (_FRAME_).size.width, (_FRAME_).size.height)

//系统单例
#define UserDefaults  [NSUserDefaults standardUserDefaults]
#define NotificationCenter  [NSNotificationCenter defaultCenter]
#define SharedApplication  [UIApplication sharedApplication]
#define APPDelegate     [[UIApplication sharedApplication] delegate]
#define FielManager [NSFileManager defaultManager]

//状态栏菊花
#define ShowNetActivity  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]
#define HiddenNetActivity     [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]


#define IsSafeString(_Str_) (![_Str_ isEqual:[NSNull null]]||_Str_ ==nil)

//系统版本
#define DEVICE_VERSION  [[UIDevice currentDevice].systemVersion floatValue]

//APPDocument路径
#define PATH_OF_DOCUMENT  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


//获得当前屏幕相关
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]

//获取当前控制器视图相关
#define CurrentVCWidth self.view.bounds.size.width
#define CurrentVCHeight self.view.bounds.size.height

//获得视图相关
#define VIEW_W(_VIEW_)  (_VIEW_.frame.size.width)
#define VIEW_H(_VIEW_)  (_VIEW_.frame.size.height)
#define VIEW_X(_VIEW_)  (_VIEW_.frame.origin.x)
#define VIEW_Y(_VIEW_)  (_VIEW_.frame.origin.y)

//NSUserDefaults 相关
#define USERDEf_OBJECT(_KEY_) [[NSUserDefaults standardUserDefaults] objectForKey:(_KEY_)]
#define USERDEF_VALUE(_KEY_) [[NSUserDefaults standardUserDefaults] valueForKey:(_KEY_)]

