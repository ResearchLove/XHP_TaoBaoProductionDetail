//
//  FirstDetailsHeaderView.m
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/18.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "FirstDetailsHeaderView.h"
#import "UIView+Frame.h"

@implementation FirstDetailsHeaderView


-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.networkNotTitleScrollView];
        [self addSubview:self.banerIndictorLabel];
    }
    return self;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [_networkNotTitleScrollView setFrame:CGRectMake(0, 0, Screen_Width, self.frameHeight)];
    if (_networkImageNameAry.count > 1) {
        [_banerIndictorLabel setFrame:CGRectMake(self.frameWidth - 40, self.frameHeight - 40, 30, 30)];
    }
   
}

/**
 *   Getter and Setter
 *
 */
-(CycleScrollView *)networkNotTitleScrollView
{
    if (_networkNotTitleScrollView == nil) {
        _networkNotTitleScrollView = [[CycleScrollView alloc]init];
        _networkNotTitleScrollView.delegate = self;
        _networkNotTitleScrollView.autoScroll=NO;
        _networkNotTitleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
        _networkNotTitleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    }
    return _networkNotTitleScrollView;
}

-(UILabel *)banerIndictorLabel
{
    if (_banerIndictorLabel == nil) {
        _banerIndictorLabel = [[UILabel alloc]init];
        _banerIndictorLabel.layer.cornerRadius = 15.0f;
        _banerIndictorLabel.clipsToBounds = YES;
        _banerIndictorLabel.backgroundColor = [UIColor grayColor];
        _banerIndictorLabel.font = [UIFont systemFontOfSize:12.0f];
        _banerIndictorLabel.textColor = [UIColor whiteColor];
        _banerIndictorLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _banerIndictorLabel;
}


/**
 *  设置数据
 *
 */
-(void)setNetworkImageNameAry:(NSArray *)networkImageNameAry
{
    _networkImageNameAry = networkImageNameAry;
    _networkNotTitleScrollView.imageURLStringsGroup = networkImageNameAry;
    _banerCurImg = 1;
    _banerIndictorLabel.text=[NSString stringWithFormat:@"%ld/%lu",(long)_banerCurImg,(unsigned long)networkImageNameAry.count];
}

/**
 *  CycleScrollViewDelegate
 *
 */
-(void)cycleScrollView:(CycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    _banerIndictorLabel.text = [NSString stringWithFormat:@"%ld/%lu",index+1,_networkImageNameAry.count];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
