//
//  ViewController.m
//  YQAlertView
//
//  Created by 俞琦 on 2017/2/27.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+YQAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"加载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton new];
    btn1.frame = CGRectMake(100, 250, 100, 100);
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"成功" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1DidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton new];
    btn2.frame = CGRectMake(100, 400, 100, 100);
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"失败" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2DidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)btnDidClick
{

    [self showLoadingAlertWithMessage:@"正在加载中.."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissAlert];
    });
}

- (void)btn1DidClick
{
    [self showSuccessAlertWithMessage:@"自定义提醒控件AlertView"];
}

- (void)btn2DidClick
{
    [self showErrorAlertWithMessage:@"错误！！！"];
}

@end
