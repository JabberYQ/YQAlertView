//
//  YQAlertView.h
//  YQAlertView
//
//  Created by 俞琦 on 2017/2/27.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    YQAlertViewTypeSuccess,
    YQAlertViewTypeError,
    YQAlertViewTypeLoading
} YQAlertViewType;

@interface YQAlertView : UIView
+ (instancetype)shareAlertView;
- (void)setAlertViewType:(YQAlertViewType)type message:(NSString *)message;
- (void)show;
- (void)dismiss;
@end
