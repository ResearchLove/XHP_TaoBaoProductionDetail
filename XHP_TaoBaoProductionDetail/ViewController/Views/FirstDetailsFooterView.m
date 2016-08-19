//
//  FirstDetailsFooterView.m
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/16.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "FirstDetailsFooterView.h"
#import "UIColor+Custom.h"
#import "UIView+Frame.h"

@implementation FirstDetailsFooterView

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.lineOneView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineTwoView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat labelWidth = self.frameWidth * 0.5;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    CGFloat labelHeight = self.frameHeight * 0.5;
    CGFloat labelX = self.frameWidth * 0.5 - size.width * 0.5;
    CGFloat labelY = self.frameHeight * 0.5 - labelHeight * 0.5;
    [_titleLabel setFrame:CGRectMake(labelX, labelY, size.width, labelHeight)];
    
    CGFloat spaceX = 15.0f;
    CGFloat viewHeight = BORDER_WIDTH_1PX;
    CGFloat spaceY = self.frameHeight * 0.5 - viewHeight * 0.5;
    CGFloat viewWidth = self.frameWidth * 0.5 - size.width * 0.5 - spaceX * 3;
    [_lineOneView setFrame:CGRectMake(spaceX, spaceY, viewWidth, viewHeight)];
    
    spaceX = labelX +  size.width + spaceX * 2;
    [_lineTwoView setFrame:CGRectMake(spaceX, spaceY, viewWidth, viewHeight)];
    
}

-(UIView *)lineOneView
{
    if (_lineOneView == nil) {
        _lineOneView = [[UIView alloc]init];
        [_lineOneView setBackgroundColor:[UIColor colorGrayLine]];
    }
    return _lineOneView;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_titleLabel setText:@"继续拖动，查看图文详情"];
    }
    return _titleLabel;
}

-(UIView *)lineTwoView
{
    if (_lineTwoView == nil) {
        _lineTwoView = [[UIView alloc]init];
        [_lineTwoView setBackgroundColor:[UIColor colorGrayLine]];
    }
    return _lineTwoView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
