


//
//  Lwt_BgColorButton.m
//  lightcar
//
//  Created by 李文韬 on 15/10/19.
//  Copyright © 2015年 com.lightcar. All rights reserved.
//

#import "Lwt_BgColorButton.h"

@interface Lwt_BgColorButton ()
{
    NSMutableDictionary *_colors;
}

@end



@implementation Lwt_BgColorButton

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _colors = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    // If it is normal then set the standard background here
    if(state == UIControlStateNormal)
    {
        [super setBackgroundColor:backgroundColor];
    }
    // Store the background colour for that state
    [_colors setValue:backgroundColor forKey:[self keyForState:state]];
}

- (UIColor *)backgroundColorForState:(UIControlState)state
{
    return [_colors valueForKey:[self keyForState:state]];
}

- (void)setHighlighted:(BOOL)highlighted
{
    // Do original Highlight
    [super setHighlighted:highlighted];
    // Highlight with new colour OR replace with orignial
    NSString *highlightedKey = [self keyForState:UIControlStateHighlighted];
    UIColor *highlightedColor = [_colors valueForKey:highlightedKey];
    if (highlighted && highlightedColor) {
        [super setBackgroundColor:highlightedColor];
    } else {
        // 由于系统在调用setSelected后，会再触发一次setHighlighted，故做如下处理，否则，背景色会被最后一次的覆盖掉。
        if ([self isSelected]) {
            NSString *selectedKey = [self keyForState:UIControlStateSelected];
            UIColor *selectedColor = [_colors valueForKey:selectedKey];
            [super setBackgroundColor:selectedColor];
        } else {
            NSString *normalKey = [self keyForState:UIControlStateNormal];
            [super setBackgroundColor:[_colors valueForKey:normalKey]];
        }
    }
}
- (void)setSelected:(BOOL)selected
{
    // Do original Selected
    [super setSelected:selected];
    // Select with new colour OR replace with orignial
    NSString *selectedKey = [self keyForState:UIControlStateSelected];
    UIColor *selectedColor = [_colors valueForKey:selectedKey];
    if (selected && selectedColor) {
        [super setBackgroundColor:selectedColor];
    } else {
        NSString *normalKey = [self keyForState:UIControlStateNormal];
        [super setBackgroundColor:[_colors valueForKey:normalKey]];
    }
}


- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    NSString *enabledKey = [self keyForState:UIControlStateDisabled];
    UIColor *enabledColor = [_colors valueForKey:enabledKey];
    
    if (!enabled && enabledColor) {
        [super setBackgroundColor:enabledColor];
    } else {
        NSString *normalKey = [self keyForState:UIControlStateNormal];
        [super setBackgroundColor:[_colors valueForKey:normalKey]];
    }
}

- (NSString *)keyForState:(UIControlState)state
{
    return [NSString stringWithFormat:@"state_%d", state];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
