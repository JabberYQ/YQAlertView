//
//  YQAlertView.m
//  YQAlertView
//
//  Created by 俞琦 on 2017/2/27.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define ALERTCENTER CGPointMake(self.frame.size.width/2, self.frame.size.height/2)

#import "YQAlertView.h"
#import "YQShapeLayer.h"
#import "YQErrorLayer.h"
#import "YQSuccessLayer.h"
#import "YQLoadingLayer.h"

@interface YQAlertView()
@property (nonatomic, assign) YQAlertViewType type;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, weak) UIView *alertView;
@property (nonatomic, weak) UILabel *messageLabel;
@property (nonatomic, strong) YQShapeLayer *aniLayer;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation YQAlertView

+ (instancetype)shareAlertView
{
    static YQAlertView *handle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [[YQAlertView alloc] init];
    });
    return handle;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = [UIColor clearColor];
    self.frame = CGRectMake(0, 0, SCREENW, SCREENH);
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.alpha = 0.8;
    bottomView.frame = self.bounds;
    [self addSubview:bottomView];
    
    UIView *alertView = [UIView new];
    alertView.backgroundColor = [UIColor whiteColor];
    alertView.layer.cornerRadius = 4;
    alertView.frame = CGRectMake((self.frame.size.width - 200)/2, (self.frame.size.height-140)/2, 200, 140);
    [self addSubview:alertView];
    self.alertView = alertView;
    
    UILabel *messageLabel = [UILabel new];
    messageLabel.frame = CGRectMake(0, 100, 200, 40);
    messageLabel.hidden = YES;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = [UIColor colorWithRed:0.0431 green:0.7569 blue:0.9412 alpha:1.0];
    [alertView addSubview:messageLabel];
    self.messageLabel = messageLabel;
}

- (void)setAlertViewType:(YQAlertViewType)type message:(NSString *)message
{
    self.type = type;
    self.message = message;
    self.alpha = 1;
    
    CGRect layerRect = CGRectZero;
    if (message) {
        layerRect = CGRectMake(60, 20, 80, 80);
        self.messageLabel.text = message;
    } else {
        layerRect = CGRectMake(60, 30, 80, 80);
    }
    
    
    if (_aniLayer) {
        [_aniLayer removeFromSuperlayer];
        _aniLayer = nil;
    }
    
    
    switch (type) {
        case YQAlertViewTypeError:
            _aniLayer = [[YQErrorLayer alloc] initWithFrame:layerRect strokeColor:[UIColor colorWithRed:0.0431 green:0.7569 blue:0.9412 alpha:1.0]];
            break;
        case YQAlertViewTypeSuccess:
            _aniLayer = [[YQSuccessLayer alloc] initWithFrame:layerRect strokeColor:[UIColor colorWithRed:0.0431 green:0.7569 blue:0.9412 alpha:1.0]];
            break;
        default:
            _aniLayer = [[YQLoadingLayer alloc] initWithFrame:layerRect strokeColor:[UIColor colorWithRed:0.0431 green:0.7569 blue:0.9412 alpha:1.0]];
            break;
    }
    [self.alertView.layer addSublayer:_aniLayer];
    
    
    if (type != YQAlertViewTypeLoading) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismiss];
        });
    }
}

- (void)show
{
    [UIView animateWithDuration:0.5 animations:^{
        
    } completion:^(BOOL finished) {
        [self layerStartAnimation];
        self.messageLabel.hidden = self.message?NO:YES;
    }];
}

- (void)layerStartAnimation
{
    [self.aniLayer startAni];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.1;
    } completion:^(BOOL finished) {
       [self removeFromSuperview];
    }];
}
@end
