//
//  JHTabBar.h
//  ProductReview
//
//  Created by Joe on 1/9/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTabBar;

@protocol JHTabBarDelegate <NSObject>

@required
/**
 *  tabBar 点击某个按钮触发方法
 *
 *  @param tabBar 当前 tabBar
 *  @param button 被点击的 button
 *  @param index  被点击 button 的索引
 */
- (void)tabBar:(JHTabBar *)tabBar didClickButton:(UIButton *)button index:(NSInteger)index;

@end

@interface JHTabBar : UIView

@property (nonatomic, weak) id<JHTabBarDelegate> delegate;

/**
 *  以传入名称的个数来实例化 tabBar
 *
 *  @param frame  tabBar 的 frame
 *  @param titles tabBar 各个 button 的名称，以数组的形式传入
 *
 *  @return JHTabBar
 */
+ (JHTabBar *)tabBarWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles;

/**
 *  点击 tabBar 中的某个 button
 *
 *  @param index button 的索引
 */
- (void)clickButtonAtIndex:(NSInteger)index;

/**
 *  修改 button 显示的名称
 *
 *  @param title 显示的名称
 *  @param index 要修改 button 的索引
 */
- (void)modifyTitle:(NSString *)title atIndex:(NSInteger)index;

@end
