//
//  ProductionDetailsViewController.m
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/14.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "ProductionDetailsViewController.h"
#import "ConfirmOrderViewController.h"

#define dragStrength 60.0 //拖拽强度

@interface ProductionDetailsViewController ()<UITableViewDelegate,SecondPageTopBarDelegate,BotomViewDelegate>

@end

@implementation ProductionDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self.view addSubview:self.firDetVC.view];
    [self addChildViewController:self.firDetVC];
   
    [self.view addSubview:self.secondDetVC.view];
    [self addChildViewController:self.secondDetVC];
    
    [self.view addSubview:self.buyBottomView];
    
    // Do any additional setup after loading the view.
}

/**
 *  Getter and Setter
 *
 */
-(UIBarButtonItem *)leftItem
{
    if (_leftItem == nil) {
        _leftItem = [[UIBarButtonItem alloc]initWithTitle:nil style:UIBarButtonItemStylePlain target:nil action:nil];
        _leftItem.customView = self.backBtn;
    }
    return _leftItem;
}

-(UIButton *)backBtn
{
    if (_backBtn == nil) {
        _backBtn = [[UIButton alloc]init];
        _backBtn.tintColor = [UIColor whiteColor];
        _backBtn.frame = CGRectMake(0, 0, 30, 30);
        _backBtn.layer.masksToBounds = YES;
        _backBtn.layer.cornerRadius = 30/2;
        _backBtn.layer.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.8].CGColor;
        [_backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backEvnet:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(FirstDetailsViewController *)firDetVC
{
    if (_firDetVC == nil) {
        _firDetVC = [[FirstDetailsViewController alloc]init];
        _firDetVC.tableView.delegate = self;
        _firDetVC.tableView.showsVerticalScrollIndicator = NO;
        _firDetVC.tableView.tag = FirstDetailsTag;
    }
    return _firDetVC;
}

-(SecondDetailsViewController *)secondDetVC
{
    if (_secondDetVC == nil) {
        _secondDetVC = [[SecondDetailsViewController alloc]init];
        _secondDetVC.tableView.delegate = self;
        _secondDetVC.tableView.tag = SecondDetailsTag;
        
    }
    return _secondDetVC;
}

-(SecondPageTopBar *)secPagTopBar
{
    if (_secPagTopBar == nil) {
        _secPagTopBar = [[SecondPageTopBar alloc]initWithArray:@[@"图文详情",@"包装参数",@"商品评价"]];
        _secPagTopBar.frame = CGRectMake(0, NaviBarHeight, Screen_Width, TopTabBarHeight);\
        _secPagTopBar.delegate = self;
        [self.view addSubview:_secPagTopBar];
    }
    return _secPagTopBar;
}

-(BuyBottomView *)buyBottomView
{
    if (_buyBottomView == nil) {
        _buyBottomView = [BuyBottomView botomViewWithFrame:CGRectMake(0, Screen_Height-BottomHeight, Screen_Width, BottomHeight) withDelegate:self];
        [self.view bringSubviewToFront:_buyBottomView];
    }
    return _buyBottomView;
}

-(UILabel *)secondPageHederLabel
{
    if (_secondPageHederLabel == nil) {
        _secondPageHederLabel = [[UILabel alloc]init];
        _secondPageHederLabel.frame = CGRectMake(0, NaviBarHeight + TopTabBarHeight + 8, Screen_Width, 21);
        _secondPageHederLabel.textColor=[UIColor blackColor];
        _secondPageHederLabel.font=[UIFont systemFontOfSize:13.0f];
        _secondPageHederLabel.alpha=0;
        _secondPageHederLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _secondPageHederLabel;
}

-(UIButton *)backToTopViewBtn
{
    if (_backToTopViewBtn == nil) {
        _backToTopViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(Screen_Width - 15 - 40, Screen_Height - BottomHeight - 20 - 40, 40, 40)];
        [_backToTopViewBtn setImage:[UIImage imageNamed:@"scroll_top_btn"] forState:UIControlStateNormal];
        [_backToTopViewBtn addTarget:self action:@selector(backToTopView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backToTopViewBtn];
    }
    return _backToTopViewBtn;
}

-(NSArray *)networkImageNameAry
{
    if (_networkImageNameAry == nil) {
        _networkImageNameAry = @[@"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",@"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",@"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"];
    }
    return _networkImageNameAry;
}

/**
 *  UIScrollViewDedlegate
 *
 *  滚动视图滚动时调用
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == FirstDetailsTag) {
        _heightDifference = 275 - NaviBarHeight;
        _dis = scrollView.contentOffset.y;
        if(_dis <= _heightDifference && _dis >= 0){
            [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColorFromRGB(0x424242) colorWithAlphaComponent:_dis/_heightDifference] ] forBarMetrics:UIBarMetricsDefault];
            self.navigationItem.leftBarButtonItem.customView.backgroundColor = [UIColorFromRGB(0x424242) colorWithAlphaComponent: 0.8 * (1 - _dis / _heightDifference)];
        }
        
        if (_dis >= _heightDifference) {
            self.navigationController.navigationBar.translucent = NO;
        }else{
            self.navigationController.navigationBar.translucent = YES;
        }
    }
    
    if (scrollView.tag == SecondDetailsTag) {
        CGFloat  mininumContenOffSet_Y = 0;
        CGFloat  maxContentOffSet_Y= -dragStrength;
        self.secondPageHederLabel.alpha=scrollView.contentOffset.y / maxContentOffSet_Y;
        if (scrollView.contentOffset.y > maxContentOffSet_Y && scrollView.contentOffset.y < mininumContenOffSet_Y) {
            self.secondPageHederLabel.text = @"下拉，回到宝贝详情";
            [self.view addSubview:self.secondPageHederLabel];
        }
        if(scrollView.contentOffset.y < maxContentOffSet_Y){
            self.secondPageHederLabel.text = @"释放，回到宝贝详情";
        }
    }
}

/**
 *  UIScrollViewDedlegate
 *
 *  滚动视图停止拖拽时调用
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.tag == FirstDetailsTag) {
        CGFloat mininumContentset_Y=_firDetVC.tableView.contentSize.height - Screen_Height+ BottomHeight + dragStrength;
        if(scrollView.contentOffset.y > mininumContentset_Y){
            self.secPagTopBar.hidden = NO;
            [self.view bringSubviewToFront:self.buyBottomView];
            
            self.backToTopViewBtn.hidden = NO;

            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.secPagTopBar.frame = CGRectMake(0, NaviBarHeight, Screen_Width,TopTabBarHeight);
                _secondDetVC.tableView.frame = CGRectMake(0,NaviBarHeight + TopTabBarHeight,Screen_Width,Screen_Height - BottomHeight - TopTabBarHeight - NaviBarHeight);
                _firDetVC.tableView.frame=CGRectMake(0, NaviBarHeight- (Screen_Height - BottomHeight), Screen_Width, Screen_Height-BottomHeight);
            } completion:^(BOOL finished) {
    
            }];
        }
    }
    
    if (scrollView.tag == SecondDetailsTag) {
        CGFloat  maxContentOffSet_Y= -dragStrength;
       
        if (scrollView.contentOffset.y < maxContentOffSet_Y) {
            self.backToTopViewBtn.hidden = YES;
            [self.view bringSubviewToFront:self.buyBottomView];
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.secondPageHederLabel.alpha = 0;
                self.secPagTopBar.frame = CGRectMake(0, Screen_Height, Screen_Width, TopTabBarHeight);
                _firDetVC.tableView. frame=CGRectMake(0, 0, Screen_Width, Screen_Height-BottomHeight);
                _secondDetVC.tableView.frame=CGRectMake(0, Screen_Height+TopTabBarHeight, Screen_Width, Screen_Height-NaviBarHeight-BottomHeight-TopTabBarHeight);
            } completion:^(BOOL finished) {
                self.secPagTopBar.hidden = YES;
             
            }];
        }
    }
}

/**
 *  BotomViewDelegate
 *
 */
-(void)clickedBotomViewBtnWithBtnTag:(NSInteger)btnTag
{
    switch (btnTag) {
        case 0:{
        }
            break;
        case 1:{
            
        }
            break;
        case 2:{
            
        }
            break;
            
        case 3:{
            
        }
            break;
        case 4:{
            ConfirmOrderViewController *conOrdVC = [[ConfirmOrderViewController alloc]init];
            [self.navigationController pushViewController:conOrdVC animated:YES];
        }
            break;
        default:
            break;
    }
    NSLog(@"you click botom tag %ld",(long)btnTag);
}

/**
 *  SecondPageTopBarDelegate
 *
 */
-(void)tabBar:(SecondPageTopBar *)tabBar didSelectIndex:(NSInteger)index
{
    [_secondDetVC didTobBarPageSelectIndex:index];
 
}

/**
 * UITableViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == FirstDetailsTag) {
        if (section == 0) {
            return 260.0f;
        }
    }
    return 0.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView.tag == FirstDetailsTag) {
        
          return 40.0f;
    }
    return 0.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == FirstDetailsTag) {
        if (section == 0) {
            FirstDetailsHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FirstDetailsHeaderView"];
            view.networkImageNameAry = self.networkImageNameAry;
            return view;
        }
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (tableView.tag == FirstDetailsTag) {
        if (section == 0) {
            FirstDetailsFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FirstDetailsFooterView"];
            return view;
        }
    }
    return nil;
}

/**
 *
 *  设置图片背景颜色
 *  @param color
 *
 *  @return
 */
-(UIImage *)imageWithBgColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  滚动到顶部
 */
-(void)backToTopView:(UIButton *)sender{
    self.backToTopViewBtn.hidden=YES;
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _secPagTopBar.frame=CGRectMake(0, Screen_Height, Screen_Width, TopTabBarHeight);
        _secondDetVC.tableView.frame=CGRectMake(0, Screen_Height+TopTabBarHeight, Screen_Width, Screen_Height -NaviBarHeight - BottomHeight - TopTabBarHeight);
        _firDetVC.tableView.contentOffset=CGPointMake(0, 0);
        _firDetVC.tableView.frame=CGRectMake(0, 0, Screen_Width, Screen_Height - BottomHeight);
        _secondPageHederLabel.alpha=0;
    } completion:^(BOOL finished) {
        _secPagTopBar.hidden=YES;
    }];
}

/**
 *  返回事件
 *
 *  @param sender
 */
-(void)backEvnet:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_dis == 0) {
       [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0]] forBarMetrics:UIBarMetricsDefault];
          self.navigationItem.leftBarButtonItem.customView.backgroundColor = [UIColorFromRGB(0x424242) colorWithAlphaComponent: 1];
    }else if(_dis <= _heightDifference && _dis > 0){
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[DEFAULT_NAVBAR_COLOR colorWithAlphaComponent:_dis / _heightDifference] ] forBarMetrics:UIBarMetricsDefault];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:DEFAULT_NAVBAR_COLOR] forBarMetrics:UIBarMetricsDefault];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
