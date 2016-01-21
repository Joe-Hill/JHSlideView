//
//  JHStarsView.m
//  grap-data
//
//  Created by Joe on 1/8/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHStarsView.h"

#define JHStarSide 13

@interface JHStarsView ()
@property (nonatomic, strong) UIView *colorView;
@end

@implementation JHStarsView
- (instancetype)init {
    self = [super init];
    if (self) {
        //  创建 starsView 背景为白色
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //  添加遮盖 colorView 背景为星颜色
    [self addSubview:self.colorView];
    //  并排添加 5 个星
    for (int i = 0; i < 5; i++) {
        UIImageView *starView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_empty"]];
        CGRect      frame     = starView.frame;
        frame.origin.x = JHStarSide * i;
        starView.frame = frame;
        [self addSubview:starView];
    }
}

#pragma mark - setters
- (void)setFrame:(CGRect)frame {
    [super setFrame:(CGRect){frame.origin, {JHStarSide * 5, JHStarSide}}];
}

- (void)setScore:(CGFloat)score {
    _score = score;
    //  创建遮盖 colorView 背景为星颜色 长度为 score/5
    CGFloat colorViewX     = score > 5 ? JHStarSide * 5 : JHStarSide *fabs(score);
    CGRect  colorViewFrame = (CGRect){0, 0, colorViewX, JHStarSide};
    self.colorView.frame = colorViewFrame;
}

#pragma mark - getters
- (UIView *)colorView {
    if (_colorView == nil) {
        _colorView                 = [[UIView alloc] init];
        _colorView.backgroundColor = JHDefaultColor;

    }
    return _colorView;
}

@end
