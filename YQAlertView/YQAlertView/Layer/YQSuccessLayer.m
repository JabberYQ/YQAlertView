//
//  YQSuccessLayer.m
//  YQAlertView
//
//  Created by 俞琦 on 2017/3/1.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import "YQSuccessLayer.h"

@interface YQSuccessLayer()
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *successLayer;
@end

@implementation YQSuccessLayer
- (instancetype)initWithFrame:(CGRect)frame strokeColor:(UIColor *)color
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor].CGColor;
        self.color = color;
        self.frame = frame;
        [self configShape];
    }
    return self;
}

- (void)configShape
{
    _circleLayer = [[CAShapeLayer alloc] init];
    _circleLayer.frame = self.bounds;
    _circleLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    _circleLayer.strokeStart = 1;
    _circleLayer.lineWidth = 3;
    _circleLayer.strokeColor = self.color.CGColor;
    _circleLayer.fillColor = [UIColor clearColor].CGColor;
    [_circleLayer setValue:@(-M_PI_2) forKeyPath:@"transform.rotation.z"];
    [self addSublayer:_circleLayer];
    
    
    _successLayer = [[CAShapeLayer alloc] init];
    _successLayer.frame = CGRectMake(self.frame.size.width*0.15, self.frame.size.height*0.15, self.frame.size.width*0.7, self.frame.size.width*0.7);
    _successLayer.path = [self successLayerPath].CGPath;
    _successLayer.strokeEnd = 0;
    _successLayer.lineWidth = 5;
    _successLayer.strokeColor = self.color.CGColor;
    _successLayer.fillColor = [UIColor clearColor].CGColor;
    _successLayer.lineCap = kCALineCapRound;
    _successLayer.lineJoin = kCALineJoinRound;
    [self addSublayer:_successLayer];
}

- (UIBezierPath *)successLayerPath
{
    // 中点为0.35 0.35
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.frame.size.width*0.09, self.frame.size.width*0.37)];
    [path addLineToPoint:CGPointMake(self.frame.size.width*0.29, self.frame.size.width*0.57)];
    [path addLineToPoint:CGPointMake(self.frame.size.width*0.64, self.frame.size.width*0.22)];
    return path;
}

- (void)startAni
{
    CABasicAnimation *circleAni = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    circleAni.toValue = @(0);
    circleAni.duration = 1;
    circleAni.removedOnCompletion = NO;
    circleAni.fillMode = kCAFillModeForwards;
    circleAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_circleLayer addAnimation:circleAni forKey:@"circleAni"];
    
    CABasicAnimation *successAni = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    successAni.toValue = @(1);
    successAni.duration = 1;
    successAni.removedOnCompletion = NO;
    successAni.fillMode = kCAFillModeForwards;
    successAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_successLayer addAnimation:successAni forKey:@"successAni"];
}
@end
