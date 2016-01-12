//
//  JHPageView.h
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHPageView : UIScrollView

@property (nonatomic, strong, readonly) NSArray<UIView *> *placeHolderViews;

/**
 *  实例化一个 JHPageView
 *
 *  @param frame     pageView 的 frame
 *  @param pageCount pageView 的 页数
 *
 *  @return JHPageView
 */
+ (JHPageView *)pageViewWithFrame:(CGRect)frame pageCount:(NSUInteger)pageCount;

/**
 *  为 pageView 中的占位视图添加具体的内容子视图
 *
 *  @param view  内容子视图
 *  @param index 要添加子视图的占位视图的索引
 */
- (void)initPlaceHolderViewWithView:(UIView *)view atIndex:(NSInteger)index;

@end
