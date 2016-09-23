//
//  Lwt_BgColorButton.h
//  lightcar
//
//  Created by 李文韬 on 15/10/19.
//  Copyright © 2015年 com.lightcar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lwt_BgColorButton : UIButton

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
- (UIColor *)backgroundColorForState:(UIControlState)state;

@end
