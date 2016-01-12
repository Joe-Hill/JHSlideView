//
//  JHSlideView.h
//  ProductReview
//
//  Created by Joe on 1/9/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JHTabBar.h"

@class JHSlideView;

@protocol JHSlideViewDelegate <NSObject>

@required
/**
 *  当前出现的占位视图为空
 *
 *  @param slideView 当前 slideView
 *  @param index     占位视图的索引
 */
- (void)slideView:(JHSlideView *)slideView didMoveToEmptyPlaceHolderViewAtIndex:(NSInteger)index;

@optional
- (void)slideView:(JHSlideView *)slideView didMoveToPlaceHolderViewAtIndex:(NSInteger)index;
@end

@interface JHSlideView : UIView<JHTabBarDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) id<JHSlideViewDelegate> delegete;

/**
 *  实例化 JHSlideView
 *
 *  @param frame  视图的 frame
 *  @param titles 视图中 button 要显示的名称
 *
 *  @return JHSlideView
 */
+ (JHSlideView *)viewWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles;

/**
 *  为占位视图加载内容子视图
 *
 *  @param view  内容子视图
 *  @param index 占位视图的索引
 */
- (void)loadView:(UIView *)view forPlaceHolderViewAtIndex:(NSInteger)index;

/**
 *  修改 JHSlideView 中某个 button 的名称
 *
 *  @param title 名称
 *  @param index 要修改 button 的索引
 */
- (void)modifyTitle:(NSString *)title atIndex:(NSInteger)index;

@end
