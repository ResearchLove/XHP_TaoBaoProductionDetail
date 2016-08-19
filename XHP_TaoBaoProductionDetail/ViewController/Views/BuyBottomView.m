//
//  BuyBottomView.m
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/16.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "BuyBottomView.h"

@implementation BuyBottomView

+(id)botomViewWithFrame:(CGRect)frame withDelegate:(id<BotomViewDelegate>)delegate{
    BuyBottomView * bottomView=[[BuyBottomView alloc]initWithFrame:frame];
    bottomView.botomViewDelegate=delegate;
    bottomView.backgroundColor = [UIColor whiteColor];
    UIView * lineView=[[UIView alloc]initWithFrame:CGRectMake(0, Screen_Height-BottomHeight+0.5, Screen_Width,0.5)];
    lineView.backgroundColor=[UIColor lightGrayColor];
    [bottomView addSubview:lineView];
    
    NSArray * btnCollerArr=@[[UIColor orangeColor],[UIColor redColor]];
    NSArray * btnImgArr=@[@"tmall_search_collection_normal_new",@"tbmirror_share",@"tabbar_cart"];
    NSArray * btnTitleArr=@[@"加入购物车",@"立即购买"];
    NSArray * labelTieleArr=@[@"关注",@"分享",@"购物车"];
    for (int i=0; i<5; i++) {
        if (i <= 2) {
            UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(i*BottomHeight+12, 5, 20, 20)];
            [bottomView addSubview:btn];
            btn.tag=i;
            [btn setImage:[UIImage imageNamed:btnImgArr[i]] forState:UIControlStateNormal];
            [btn addTarget:bottomView action:@selector(clikedBtn:) forControlEvents:UIControlEventTouchUpInside];
            UILabel * titleLab=[[UILabel alloc]initWithFrame:CGRectMake(i * BottomHeight, CGRectGetMaxY(btn.frame)+3, BottomHeight, BottomHeight- 5 - 20 - 3)];
            titleLab.textAlignment=NSTextAlignmentCenter;
            titleLab.font=[UIFont systemFontOfSize:10];
            [bottomView addSubview:titleLab];
            titleLab.text=labelTieleArr[i];
        }else{
            CGFloat btnWidth=(Screen_Width-BottomHeight*3)/2;
            UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(BottomHeight*3+btnWidth*(i-3), 0, btnWidth, bottomView.frame.size.height)];
            [bottomView addSubview:btn];
            btn.tag=i;
            [btn setBackgroundColor:btnCollerArr[i-3]];
            [btn setTitle:btnTitleArr[i-3] forState:UIControlStateNormal];
            btn.titleLabel.font=[UIFont systemFontOfSize:16];
            [btn addTarget:bottomView action:@selector(clikedBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return bottomView;
}
-(void)clikedBtn:(UIButton*)btn{
    if ([self.botomViewDelegate respondsToSelector:@selector(clickedBotomViewBtnWithBtnTag:)]) {
        [self.botomViewDelegate clickedBotomViewBtnWithBtnTag:btn.tag];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
