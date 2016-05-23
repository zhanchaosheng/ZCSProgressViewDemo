//
//  ZCSRainbowProgressView.m
//  ZCSProgressViewDemo
//
//  Created by Cusen on 16/5/24.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "ZCSRainbowProgressView.h"

@implementation ZCSRainbowProgressView

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 创建水平梯度Layer
        CAGradientLayer *layer = (id)[self layer];
        [layer setStartPoint:CGPointMake(0.0, 0.5)];
        [layer setEndPoint:CGPointMake(1.0, 0.5)];
        
        // 创建变换的颜色数组
        NSMutableArray *colors = [NSMutableArray array];
        for (NSInteger hue = 0; hue <= 360; hue += 5)
        {
            UIColor *color = [UIColor colorWithHue:1.0 * hue / 360.0
                                        saturation:1.0
                                        brightness:1.0
                                             alpha:1.0];
            [colors addObject:(id)[color CGColor]];
        }
        [layer setColors:[NSArray arrayWithArray:colors]];
        
        //设置 mask layer，实现进度条效果
        _maskLayer = [CAShapeLayer layer];
        [_maskLayer setFrame:CGRectMake(0, 0, 0, frame.size.height)];
        [_maskLayer setBackgroundColor:[[UIColor blackColor] CGColor]];
        [layer setMask:_maskLayer];
        
        //循环执行颜色变换动画
        [self performAnimation];
    }
    return self;
}

- (void)performAnimation {
    // 将最后一个颜色移动到数组最前面
    CAGradientLayer *layer = (id)[self layer];
    NSMutableArray *mutable = [[layer colors] mutableCopy];
    id lastColor = [mutable lastObject];
    [mutable removeLastObject];
    [mutable insertObject:lastColor atIndex:0];
    NSArray *shiftedColors = [NSArray arrayWithArray:mutable];
    
    // 重设变换后的颜色数组
    [layer setColors:shiftedColors];
    
    // 创建一个颜色从右到左变换的动画
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    [animation setToValue:shiftedColors];
    [animation setDuration:0.08];
    [animation setRemovedOnCompletion:YES];
    [animation setFillMode:kCAFillModeForwards];
    [animation setDelegate:self];
    [layer addAnimation:animation forKey:@"animateGradient"];
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    [self performAnimation];
}

- (void)setProgress:(CGFloat)value {
    if (_progress != value) {
        // 确保进度值为0到1之间
        _progress = MIN(1.0, fabs(value));
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    // 根据进度值设置mask layer的宽度
    CGRect maskRect = [self.maskLayer frame];
    maskRect.size.width = CGRectGetWidth([self bounds]) * self.progress;
    [self.maskLayer setFrame:maskRect];
}


@end
