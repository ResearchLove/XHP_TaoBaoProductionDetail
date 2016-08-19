//
//  FirstDetailsHeaderView.h
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/18.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"

@interface FirstDetailsHeaderView : UITableViewHeaderFooterView <CycleScrollViewDelegate>


@property(strong,nonatomic) NSArray *networkImageNameAry;
@property(strong,nonatomic) CycleScrollView *networkNotTitleScrollView;
@property(nonatomic,strong)UILabel * banerIndictorLabel;
@property(assign,nonatomic) NSInteger banerCurImg;

@end
