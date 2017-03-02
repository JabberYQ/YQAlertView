//
//  YQLoadingLayer.m
//  YQAlertView
//
//  Created by 俞琦 on 2017/3/1.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import "YQLoadingLayer.h"

@interface YQLoadingLayer()
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) CAShapeLayer *loadingLayer;
//@property (nonatomic, strong) CAShapeLayer *waveLayer;
//@property (nonatomic, strong) CADisplayLink *displayLink;
//@property (nonatomic, assign) CGFloat p;
@end

@implementation YQLoadingLayer
- (instancetype)initWithFrame:(CGRect)frame strokeColor:(UIColor *)color
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor].CGColor;
        self.color = color;
        self.frame = frame;
        [self configShape];
        
//        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(beginWave)];
//        self.displayLink.paused = YES;
//        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)configShape
{
//    _waveLayer = [[CAShapeLayer alloc] init];
//    _waveLayer.frame = self.bounds;
//    _waveLayer.path = [self getWavePathA:15 w:0.14 p:0 b:self.bounds.size.height/2].CGPath;
//    _waveLayer.lineWidth = 3;
//    _waveLayer.strokeColor = self.color.CGColor;
//    _waveLayer.fillColor = [UIColor clearColor].CGColor;
//    _waveLayer.lineCap = kCALineCapRound;
//    _waveLayer.lineJoin = kCALineJoinRound;
//    [self addSublayer:_waveLayer];
//    
    _loadingLayer = [[CAShapeLayer alloc] init];
    _loadingLayer.frame = self.bounds;
    _loadingLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.bounds.size.width *0.1, self.bounds.size.height *0.1, self.bounds.size.width *0.8, self.bounds.size.height *0.8)].CGPath;
    _loadingLayer.strokeEnd = 0;
    _loadingLayer.lineWidth = 5;
    _loadingLayer.strokeColor = self.color.CGColor;
    _loadingLayer.fillColor = [UIColor clearColor].CGColor;
    _loadingLayer.lineCap = kCALineCapRound;
    _loadingLayer.lineJoin = kCALineJoinRound;
    [_loadingLayer setValue:@(-M_PI_2) forKeyPath:@"transform.rotation.z"];
    [self addSublayer:_loadingLayer];
}


// A：峰值
// w=2π/T 决定周期
// p：相位
// b：Y轴上下偏移
- (UIBezierPath *)getWavePathA:(CGFloat)A w:(CGFloat)w p:(CGFloat)p b:(CGFloat)b{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for (int i = 0; i < self.bounds.size.width; i++) {
        
        CGFloat y = A*sinf(i*w +p) + b;
        if (i == 0) {
            [path moveToPoint:CGPointMake(i, y)];
        } else {
            [path addLineToPoint:CGPointMake(i, y)];
        }
    }
    return path;
    
}

//- (void)beginWave
//{
//    self.p = self.p + 0.1;
//    _waveLayer.path = [self getWavePathA:15 w:0.14 p:self.p b:self.bounds.size.height/2].CGPath;
//}

- (void)startAni
{
    CAKeyframeAnimation *startAni = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
    startAni.removedOnCompletion = NO;
    startAni.fillMode = kCAFillModeForwards;
    startAni.values = @[@(0),@(0),@(1)];
    startAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAKeyframeAnimation *endAni = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    endAni.removedOnCompletion = NO;
    endAni.fillMode = kCAFillModeForwards;
    endAni.values = @[@(0),@(1),@(1)];
    endAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[startAni, endAni];
    group.duration = 2;
    group.repeatCount = HUGE;
    [_loadingLayer addAnimation:group forKey:@"loadingAni"];
    
//    self.displayLink.paused = NO;
}

@end
