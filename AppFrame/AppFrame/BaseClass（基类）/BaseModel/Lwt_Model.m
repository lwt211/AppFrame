
//
//  Lwt_Model.m
//  tableViewDemo
//
//  Created by 李文韬 on 16/3/25.
//  Copyright © 2016年 com.lightcar. All rights reserved.
//

#import "Lwt_Model.h"

@implementation Lwt_Model


- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        
        if (dic != nil)
        {
           
            _result = [dic CheckNullInDic];
            //                    NSLog(@"=====%@",_result);
            
            
            [self setValuesForKeysWithDictionary:_result];
            
        }
        
    }
    return self;
}


- (void)setResult:(NSDictionary *)result
{
    if (result != nil)
    {
        _result = [result CheckNullInDic];
        //        NSLog(@"%@",_result);
        
        [self setValuesForKeysWithDictionary:_result];
    }
}

//过滤没有的键 （子类重写此方法可以替换key）
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    //如
//    if ([key isEqualToString:@"id"])
//    {
//        _ID = value;
//    }
}





@end
