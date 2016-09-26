//
//  RequestManager.m
//  lightcar
//
//  Created by 李文韬 on 15/8/31.
//  Copyright (c) 2015年 TD_. All rights reserved.
//

#import "RequestManager.h"




@implementation RequestManager

/*************所有的功能接口******/











/*******************/


#pragma mark - 获取完整数据包 后期动态添加touken 等东西


+ (NSDictionary *)getTotalParameters:(NSDictionary *)parameters
{
    return parameters;
}

#pragma mark - 处理数据

+ (id )result:(id )responseObject
{
    id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];

    if ([result isKindOfClass:[NSDictionary class]])
    {
        return  [result CheckNullInDic];
        
    }else if ([result isKindOfClass:[NSArray class]])
    {
        NSMutableArray <NSDictionary *> *mutArr = [[NSMutableArray alloc] init];
        for (NSDictionary *subResult  in result)
        {
            [mutArr addObject:[subResult CheckNullInDic]];
        }
        return mutArr;
    }
    return result;
}

#pragma mark -返回错误信息
+ (NSString *)errorStr:(NSError *)error;
{
    NSString *errorStr = nil;;
    switch (error.code) {
        case AFNETEEROR_TIMEOUT: errorStr = AFNETERRORSTR_TIMEOUT;break;
        case AFNETEEROR_BADSERVER:errorStr =  AFNETEERORSTR_BADSERVER;break;
        case AFNETERROR_SERVERNONET:errorStr = AFNETERRORSTR_SERVERNONET;break;
        default:errorStr = AFNETERRORSTR_NONET;
    }
    return errorStr;
}





@end
