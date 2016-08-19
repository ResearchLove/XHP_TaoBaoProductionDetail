//
//  ProductionDetailsViewController.h
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/14.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstDetailsViewController.h"
#import "SecondDetailsViewController.h"
#import "SecondPageTopBar.h"
#import "BuyBottomView.h"

#define FirstDetailsTag  100
#define SecondDetailsTag  200


@interface ProductionDetailsViewController : UIViewController

@property (strong,nonatomic) FirstDetailsViewController *firDetVC;
@property (strong,nonatomic) SecondDetailsViewController *secondDetVC;
@property (strong,nonatomic) SecondPageTopBar *secPagTopBar;
@property (strong,nonatomic) BuyBottomView *buyBottomView;
@property (strong,nonatomic) UILabel *secondPageHederLabel;


@property (strong,nonatomic) UIButton *backBtn;
@property (strong,nonatomic) UIBarButtonItem *leftItem;
@property (strong,nonatomic) NSArray *networkImageNameAry;
@property (strong,nonatomic) UIButton *backToTopViewBtn;
@property (assign,nonatomic) CGFloat heightDifference;
@property (assign,nonatomic) CGFloat dis;


@end
