//
//  JHTabBar.m
//  ProductReview
//
//  Created by Joe on 1/9/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHTabBar.h"

#define JHSignViewHeight    5
#define JHSignViewScale     0.1

@interface JHTabBar ()
@property (nonatomic, strong) NSMutableArray<UIButton *> *buttons;                  /**< tabBar 中的按钮 */
@property (nonatomic, assign) CGFloat                    buttonWidth;               /**< 按钮的宽度 */
@property (nonatomic, assign) NSInteger                  currentButtonIndex;        /**< 当前被点击的按钮的索引 */
@property (nonatomic, strong) UIView                     *signView;                 /**< 起标记作用的下方滑动视图 */
@end

@implementation JHTabBar

#pragma mark - initialization
- (JHTabBar *)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles {
    self = [self initWithFrame:frame];
    if (self) {
        [self addSubview:[JHLineView horizontalLintWithOrign:CGPointMake(0, self.height) width:self.width color:JHGrayColor]];
        NSInteger tabCount = titles.count;
        CGFloat   width    = self.width / tabCount;
        self.buttonWidth        = width;
        self.currentButtonIndex = 0;

        [self setupButtonsWithTitles:titles];
        [self addSubview:self.signView];
    }
    return self;
}

+ (JHTabBar *)tabBarWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles {
    return [[self alloc] initWithFrame:frame titles:titles];
}

- (void)setupButtonsWithTitles:(NSArray<NSString *> *)titles {
    for (int i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame           = (CGRect){{self.buttonWidth *i, 0}, {self.buttonWidth, self.height}};
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttons addObject:button];
    }
}

#pragma mark - privte method
- (void)modifyTitle:(NSString *)title atIndex:(NSInteger)index {
    [self.buttons[index] setTitle:title forState:UIControlStateNormal];
}

#pragma mark - event respose
- (void)buttonOnClick:(UIButton *)button {
    NSInteger index   = button.x / button.width + 0.5;
    BOOL      isMoved = index - self.currentButtonIndex;
    if (isMoved) {  //  判断是否移动，如果移动就执行动画
        [UIView animateWithDuration:0.2  animations:^{
             self.signView.x = button.width * JHSignViewScale + button.width * index;
         } completion:^(BOOL finished) {    //  动画结束改变状态，执行代理方法
             [self.buttons[self.currentButtonIndex] setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
             [self.buttons[index] setTitleColor:JHDefaultColor forState:UIControlStateNormal];
             if ([self.delegate respondsToSelector:@selector(tabBar:didClickButton:index:)]) {
                 [self.delegate tabBar:self didClickButton:button index:index];
             }
             self.currentButtonIndex = index;
         }];
    }
}

/** 点击对应索引的按钮 */
- (void)clickButtonAtIndex:(NSInteger)index {
    [self buttonOnClick:self.buttons[index]];
}

#pragma mark - getters
- (NSMutableArray<UIButton *> *)buttons {
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (UIView *)signView {
    if (_signView == nil) {
        _signView                     = [[UIView alloc] initWithFrame:CGRectMake(self.buttonWidth * JHSignViewScale, self.height - JHSignViewHeight, self.buttonWidth * JHSignViewScale * 8, JHSignViewHeight)];
        _signView.backgroundColor     = JHDefaultColor;
        _signView.layer.cornerRadius  = 2;
        _signView.layer.masksToBounds = YES;
        [self.buttons[0] setTitleColor:JHDefaultColor forState:UIControlStateNormal];

    }
    return _signView;
}

@end
