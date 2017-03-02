//
//  UIViewController+YQAlertView.m
//  YQAlertView
//
//  Created by 俞琦 on 2017/2/27.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import "UIViewController+YQAlertView.h"
#import "YQAlertView.h"

@implementation UIViewController (YQAlertView)
- (void)showLoadingAlert
{
    [self showLoadingAlertWithMessage:nil];
}

- (void)showLoadingAlertWithMessage:(NSString *)message
{
    YQAlertView *alert = [YQAlertView shareAlertView];
    [alert setAlertViewType:YQAlertViewTypeLoading message:message];
    [self.view addSubview:alert];
    [alert show];
}

- (void)showErrorAlert
{
    [self showErrorAlertWithMessage:nil];
}

- (void)showErrorAlertWithMessage:(NSString *)message
{
    YQAlertView *alert = [YQAlertView shareAlertView];
    [alert setAlertViewType:YQAlertViewTypeError message:message];
    [self.view addSubview:alert];
    [alert show];
}

- (void)showSuccessAlert
{
    [self showSuccessAlertWithMessage:nil];
}

- (void)showSuccessAlertWithMessage:(NSString *)message
{
    YQAlertView *alert = [YQAlertView shareAlertView];
    [alert setAlertViewType:YQAlertViewTypeSuccess message:message];
    [self.view addSubview:alert];
    [alert show];
}

- (void)dismissAlert
{
    YQAlertView *alert = [YQAlertView shareAlertView];
    [alert dismiss];
}
@end
