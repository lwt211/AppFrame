//
//  Lwt_NoDataView.m
//  tableViewDemo
//
//  Created by 李文韬 on 16/3/24.
//  Copyright © 2016年 com.lightcar. All rights reserved.
//

#import "Lwt_NoDataView.h"

@implementation Lwt_NoDataView


- (instancetype)initWithFrame:(CGRect)frame withAddRefreshButton:(BOOL)addRefreshButton description:(NSString *)description
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIImage *image = [UIImage imageNamed:@"conpons_head_light"];
        _imageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:_imageView];
        
        _imageView.sd_layout.centerXEqualToView(self)
        .topSpaceToView(self,100)
        .widthIs(image.size.width)
        .heightIs(image.size.height);
         
        

        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.textAlignment = NSTextAlignmentCenter;
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.font = [UIFont systemFontOfSize:17];
        _descriptionLabel.textColor = [UIColor grayColor];
        _descriptionLabel.text = description;
        [self addSubview:_descriptionLabel];
        
        
        _descriptionLabel.sd_layout.centerXEqualToView(self)
        .topSpaceToView(_imageView,10)
        .autoHeightRatio(0)
        .widthRatioToView(self,0.3);
        
  
        
        if (addRefreshButton)
        {
            _refreshButton = [[UIButton alloc] init];
            _refreshButton.titleLabel.font = _descriptionLabel.font;
            [_refreshButton setTitle:@"点击刷新" forState:UIControlStateNormal];
            [_refreshButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [_refreshButton setTitleColor:[UIColor colorWithRed:220/255.0 green:63/255.0 blue:66/255.0 alpha:1] forState:UIControlStateHighlighted];
            [_refreshButton addTarget:self action:@selector(refreshButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_refreshButton];
            
            _refreshButton.sd_layout
            .centerXEqualToView(self)
            .topSpaceToView(_descriptionLabel,10)
            .heightIs(30)
            .widthRatioToView(self,0.3);
            
          
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = _refreshButton.titleLabel.textColor;
            [self addSubview:lineView];
            
            
            lineView.sd_layout
            .centerXEqualToView(self)
            .heightIs(1)
            .widthIs(70)
            .bottomEqualToView(self);
            
        }
        
        
    }
    
    return self;
    
}


- (void)refreshButtonClick
{
    _clickBlock();
}

- (void)refreshButtomClick:(void (^)(void))clickBlock
{
    _clickBlock = clickBlock;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
