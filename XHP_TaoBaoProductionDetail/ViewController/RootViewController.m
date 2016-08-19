//
//  RootViewController.m
//  XHP_TaoBaoProductionDetail
//
//  Created by xiaohaiping on 16/8/14.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:DEFAULT_NAVBAR_COLOR];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationItem setTitle:@"淘宝产品详情页演示"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.detailsBtn];
    CGFloat width = 150;
    CGFloat height = 45;
    CGFloat x = self.view.frame.size.width * 0.5 - width * 0.5;
    CGFloat y = self.view.frame.size.height * 0.5 - height * 0.5;
    [_detailsBtn setFrame:CGRectMake(x, y, width, height)];
    
    // Do any additional setup after loading the view.
}


/**
 * Getter and Setter
 *
 */
-(UIButton *)detailsBtn
{
    if (_detailsBtn == nil) {
        _detailsBtn = [[UIButton alloc]init];
        [_detailsBtn setTitle:@"淘宝产品详情页" forState:UIControlStateNormal];
        [_detailsBtn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_detailsBtn setTitleColor:Color(2.0, 187.0, 0.0, 1.0f) forState:UIControlStateNormal];
        [_detailsBtn.layer setMasksToBounds:YES];
        [_detailsBtn.layer setCornerRadius:3.0];
        [_detailsBtn.layer setBorderWidth:1.0f];
        [_detailsBtn.layer setBorderColor:Color(2.0, 187.0, 0.0, 1.0f).CGColor];
        [_detailsBtn addTarget:self action:@selector(detailsEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailsBtn;
}

-(ProductionDetailsViewController *)proDetVC
{
    if (_proDetVC == nil) {
        _proDetVC = [[ProductionDetailsViewController alloc]init];
    }
    return _proDetVC;
}

/**
 *  点击淘宝产品详情页事件
 *
 *  @param sender
 */
-(void)detailsEvent:(UIButton *)sender
{
    ProductionDetailsViewController *proDetVC = [[ProductionDetailsViewController alloc]init];
    [self.navigationController pushViewController:proDetVC animated:YES];

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
