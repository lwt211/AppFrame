//
//  UIColor+Lwt.h
//  App
//
//  Created by 李文韬 on 16/1/14.
//  Copyright © 2016年 com.wentao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIColor (Lwt)


//获得带透明的白颜色
+ (UIColor*)whiteColorWithAlpha:(CGFloat)alphaValue;

//获得带透明的黑颜色
+ (UIColor*)blackColorWithAlpha:(CGFloat)alphaValue;

//随机颜色
+ (UIColor *)randomColor;

//颜色代码转RGB(如:ff9ab00)
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

/**
 * 16进制颜色(html颜色值)字符串转为UIColor
 **/
+(UIColor *)hexStringToColor:(NSString *)stringToConvert;


@property (nonatomic, assign, readonly) CGFloat red;


@property (nonatomic, assign, readonly) CGFloat green;


@property (nonatomic, assign, readonly) CGFloat blue;


@property (nonatomic, assign, readonly) CGFloat alpha;


@end
