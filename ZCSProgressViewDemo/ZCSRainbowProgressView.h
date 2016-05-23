//
//  ZCSRainbowProgressView.h
//  ZCSProgressViewDemo
//
//  Created by Cusen on 16/5/24.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  水平彩色动画进度条视图
 */
@interface ZCSRainbowProgressView : UIView
@property (nonatomic, strong, readonly) CAShapeLayer *maskLayer;
@property (nonatomic, assign) CGFloat progress;
@end
