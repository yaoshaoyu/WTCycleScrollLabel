//
//  ViewController.m
//  WTCycleScrollLabel
//
//  Created by 吕成翘 on 2018/9/17.
//  Copyright © 2018年 Weitac. All rights reserved.
//

#import "ViewController.h"
#import "WTCycleScrollLabel.h"


@interface ViewController ()

@end


@implementation ViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - Pirvate

/**
 设置界面
 */
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    WTCycleScrollLabel *cycleScrollLabel = [[WTCycleScrollLabel alloc] initWithFrame:CGRectMake(15.0, 100.0, self.view.bounds.size.width - 30.0, 25.0)];
    cycleScrollLabel.backgroundColor = [UIColor colorWithRed:255.0 / 255.0 green:217.0 / 255.0 blue:163.0 / 255.0 alpha:1.0];
    cycleScrollLabel.title = @"大江东去，浪淘尽，千古风流人物。故垒西边，人道是，三国周郎赤壁。乱石穿空，惊涛拍岸，卷起千堆雪。江山如画，一时多少豪杰。遥想公瑾当年，小乔初嫁了，雄姿英发。羽扇纶巾，谈笑间，樯橹灰飞烟灭。故国神游，多情应笑我，早生华发。人生如梦，一尊还酹江月。";
    [self.view addSubview:cycleScrollLabel];
}

@end
