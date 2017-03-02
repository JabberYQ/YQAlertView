//
//  YQShapeLayer.h
//  YQAlertView
//
//  Created by 俞琦 on 2017/3/1.
//  Copyright © 2017年 俞琦. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface YQShapeLayer : CAShapeLayer
- (instancetype)initWithFrame:(CGRect)frame strokeColor:(UIColor *)color;
- (void)startAni;
@end
