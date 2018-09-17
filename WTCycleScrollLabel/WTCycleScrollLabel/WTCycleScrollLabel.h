//
//  WTCycleScrollLabel.h
//  WTSDWebImageDemo
//
//  Created by 吕成翘 on 2018/5/3.
//  Copyright © 2018年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WTCycleScrollLabel : UIView

@property (nonatomic, copy) NSString *title;

- (void)startAnimation;
- (void)stopAnimation;

@end
