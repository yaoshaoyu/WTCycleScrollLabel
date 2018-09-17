//
//  WTCycleScrollLabel.m
//  WTSDWebImageDemo
//
//  Created by 吕成翘 on 2018/5/3.
//  Copyright © 2018年 Weitac. All rights reserved.
//

#import "WTCycleScrollLabel.h"


static const CGFloat labelMargin = 30.0;    // 标签的间距


@interface WTCycleScrollLabel ()

@property (nonatomic, strong) UIScrollView *scrollView;    // 滚动视图
@property (nonatomic, strong) UILabel *titleLabel;         // 标题标签
@property (nonatomic, strong) UILabel *twinLabel;          // 复制标签

@end


@implementation WTCycleScrollLabel

#pragma mark - CustomAccessors
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    _titleLabel.text = _title;
    
    CGRect titleRect = [_title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0]} context:nil];
    _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y, titleRect.size.width, _scrollView.bounds.size.height);
    
    if (titleRect.size.width > self.bounds.size.width) {
        
        _twinLabel.hidden = NO;
        _twinLabel.text = _title;
        _twinLabel.frame = CGRectMake(_titleLabel.frame.origin.x + _titleLabel.frame.size.width + labelMargin, _titleLabel.frame.origin.y, titleRect.size.width, _scrollView.bounds.size.height);
        _scrollView.contentSize = CGSizeMake(_twinLabel.frame.origin.x + _twinLabel.frame.size.width, _scrollView.bounds.size.height * 0.5);
        
        [self startAnimation];
        
    } else {
        
        _twinLabel.hidden = YES;
        _twinLabel.text = @"";
        _scrollView.contentSize = CGSizeMake(_titleLabel.frame.origin.x + _titleLabel.frame.size.width, _scrollView.bounds.size.height * 0.5);
        
        [self stopAnimation];
    }
}

#pragma mark - Private
/**
 设置界面
 */
- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.userInteractionEnabled = NO;
    [self addSubview:scrollView];
    _scrollView = scrollView;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    titleLabel.font = [UIFont systemFontOfSize:13.0];
    titleLabel.tintColor = [UIColor colorWithRed:102.0 / 255.0 green:102.0 / 255.0 blue:102.0 / 255.0 alpha:1.0];
    titleLabel.numberOfLines = 1;
    [scrollView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UILabel *twinLabel = [[UILabel alloc] initWithFrame:self.bounds];
    twinLabel.font = [UIFont systemFontOfSize:13.0];
    twinLabel.tintColor = [UIColor colorWithRed:102.0 / 255.0 green:102.0 / 255.0 blue:102.0 / 255.0 alpha:1.0];
    twinLabel.numberOfLines = 1;
    twinLabel.hidden = YES;
    [scrollView addSubview:twinLabel];
    _twinLabel = twinLabel;
}

/**
 开始动画
 */
- (void)startAnimation {
    
    [self stopAnimation];
    
    [UIView animateWithDuration:_title.length * 0.1 * 2 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^{
        
        [self.scrollView setContentOffset:CGPointMake(self.twinLabel.frame.origin.x, 0) animated:NO];
        
    } completion:nil];
}

/**
 停止动画
 */
- (void)stopAnimation {
    
    [_scrollView.layer removeAllAnimations];
    [_scrollView setContentOffset:CGPointZero animated:NO];
}

@end
