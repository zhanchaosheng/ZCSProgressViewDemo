//
//  ViewController.m
//  ZCSProgressViewDemo
//
//  Created by Cusen on 16/5/23.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "ViewController.h"
#import "ZCSCircleProgressView.h"
#import "ZCSRainbowProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ZCSRainbowProgressView *rainbowView = [[ZCSRainbowProgressView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 5)];
    rainbowView.progress = 0.6f;
    [self.view addSubview:rainbowView];
    
    ZCSCircleProgressView *circleView = [[ZCSCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    circleView.center = self.view.center;
    circleView.trackColor = [UIColor lightGrayColor];
    circleView.progressColor = [UIColor orangeColor];
    circleView.progress = 0.6f;
    [self.view addSubview:circleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
