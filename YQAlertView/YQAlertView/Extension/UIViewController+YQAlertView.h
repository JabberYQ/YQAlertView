//
//  UIViewController+YQAlertView.h
//  YQAlertView
//
//  Created by 俞琦 on 2017/2/27.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YQAlertView)
- (void)showLoadingAlert;
- (void)showLoadingAlertWithMessage:(NSString *)message;
- (void)showErrorAlert;
- (void)showErrorAlertWithMessage:(NSString *)message;
- (void)showSuccessAlert;
- (void)showSuccessAlertWithMessage:(NSString *)message;
- (void)dismissAlert;
@end
