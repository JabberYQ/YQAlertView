//
//  YQErrorLayer.m
//  YQAlertView
//
//  Created by 俞琦 on 2017/3/1.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import "YQErrorLayer.h"

@interface YQErrorLayer()
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *errorLayer;
@end

@implementation YQErrorLayer
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
    
    
    _errorLayer = [[CAShapeLayer alloc] init];
    _errorLayer.frame = CGRectMake(self.frame.size.width*0.15, self.frame.size.height*0.15, self.frame.size.width*0.7, self.frame.size.width*0.7);
    _errorLayer.path = [self errorLayerPath].CGPath;
    _errorLayer.strokeEnd = 0;
    _errorLayer.lineWidth = 5;
    _errorLayer.strokeColor = self.color.CGColor;
    _errorLayer.fillColor = [UIColor clearColor].CGColor;
    _errorLayer.lineCap = kCALineCapRound;
    _errorLayer.lineJoin = kCALineJoinRound;
    [self addSublayer:_errorLayer];
}

- (UIBezierPath *)errorLayerPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.frame.size.width*0.1, self.frame.size.width*0.1)];
    [path addLineToPoint:CGPointMake(self.frame.size.width*0.6, self.frame.size.width*0.6)];
    [path moveToPoint:CGPointMake(self.frame.size.width*0.6, self.frame.size.width*0.1)];
    [path addLineToPoint:CGPointMake(self.frame.size.width*0.1, self.frame.size.width*0.6)];
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
    
    CABasicAnimation *errorAni = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    errorAni.toValue = @(1);
    errorAni.duration = 1;
    errorAni.removedOnCompletion = NO;
    errorAni.fillMode = kCAFillModeForwards;
    errorAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_errorLayer addAnimation:errorAni forKey:@"errorAni"];
}

- (void)stopAni
{
    
}
@end
