//
//  Lwt_Model.h
//  tableViewDemo
//
//  Created by 李文韬 on 16/3/25.
//  Copyright © 2016年 com.lightcar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lwt_Model : NSObject


@property (nonatomic,strong) NSDictionary *result;


- (instancetype)initWithDic:(NSDictionary *)dic;


@end
