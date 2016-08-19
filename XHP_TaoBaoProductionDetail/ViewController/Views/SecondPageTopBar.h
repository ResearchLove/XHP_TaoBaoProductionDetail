//
//  SecondPageTopBar.h
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/16.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarButton.h"

@class SecondPageTopBar;
@protocol SecondPageTopBarDelegate <NSObject>

@required
-(void)tabBar:(SecondPageTopBar *)tabBar didSelectIndex:(NSInteger)index;

@end

@interface SecondPageTopBar : UIView

@property(nonatomic,weak) id<SecondPageTopBarDelegate> delegate;

/**
 静态方法初始化
 */
+(instancetype)tabbar;
/**
 使用数组初始化
 */
-(instancetype)initWithArray:(NSArray*)array;
-(void)AddTarBarBtn:(NSString *)name;//添加顶部标题项的名字
-(void)TabBtnClick:(TopBarButton *)sender;//监听tabbar的点击

@end
