//
//  BuyBottomView.h
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/16.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BotomViewDelegate <NSObject>

@required
-(void)clickedBotomViewBtnWithBtnTag:(NSInteger)btnTag;

@end

@interface BuyBottomView : UIView

@property(nonatomic,weak)id<BotomViewDelegate>botomViewDelegate;
+(id)botomViewWithFrame:(CGRect)frame withDelegate:(id<BotomViewDelegate>)delegate;

@end
