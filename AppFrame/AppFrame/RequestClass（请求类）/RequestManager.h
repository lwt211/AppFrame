//
//  RequestManager.h
//  lightcar
//
//  Created by 李文韬 on 15/8/31.
//  Copyright (c) 2015年 TD_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lwt_Network.h"
#import "AllURL.h"


//错误提示
typedef NS_ENUM(NSInteger,AFNetErrorCode)
{
    AFNETEEROR_TIMEOUT = -1001,
    AFNETEEROR_BADSERVER = -1011,
    AFNETERROR_SERVERNONET = -1004
    
};



static NSString * const AFNETERRORSTR_NONET = @"网络错误";
static NSString * const AFNETERRORSTR_TIMEOUT = @"请求超时";
static NSString * const AFNETERRORSTR_SERVERNONET = @"未能连接到服务器";
static NSString * const AFNETEERORSTR_BADSERVER = @"响应失败，请检查URL";


typedef void(^RequsetSucceed)(NSDictionary *result);

typedef void(^RequsetFaild)(NSString *errStr);

typedef void(^DownloadSucceed)(NSURL *path);

typedef void (^DownloadFaild)(NSError *error);

typedef void (^DownloadProgress)(CGFloat progress);


@interface RequestManager : NSObject


@property (nonatomic,copy) RequsetSucceed succeed;

@property (nonatomic,copy) RequsetFaild faild;



@end
