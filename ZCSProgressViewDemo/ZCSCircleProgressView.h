//
//  ZCSCircleProgressView.h
//  ZCSProgressViewDemo
//
//  Created by Cusen on 16/5/23.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  时钟进度条视图
 */
@interface ZCSCircleProgressView : UIView

@property (strong, nonatomic) UIColor *trackColor; //进度条背景颜色
@property (strong, nonatomic) UIColor *progressColor; //进度条前景颜色
@property (assign, nonatomic) float progressWidth; //时钟边框宽度
@property (assign, nonatomic) float progress; //进度值，0~1之间的数

- (void)setProgress:(float)progress animated:(BOOL)animated;
@end
