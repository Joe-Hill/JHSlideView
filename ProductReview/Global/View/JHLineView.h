//
//  JHLineView.h
//  ProductReview
//
//  Created by Joe on 1/13/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, JHLineViewStyle) {
    JHLineViewStyleHorizon,
    JHLineViewStyleVertical
};

@interface JHLineView : UIView
@property (nonatomic, assign) JHLineViewStyle lineViewStyle;
/**
 *  一条 1 像素的线
 *
 *  @param lineViewStyle 垂直或者水平
 *  @param color         颜色
 *
 *  @return 1 像素的线
 */
+ (UIView *)lineWithStyle:(JHLineViewStyle)lineViewStyle color:(UIColor *)color;

/**
 *  一条 1 像素的水平线
 *
 *  @param orign 坐标
 *  @param width 宽度
 *  @param color 颜色
 *
 *  @return 一条 1 像素的水平线
 */
+ (UIView *)horizontalLintWithOrign:(CGPoint)orign width:(CGFloat)width color:(UIColor *)color;

/**
 *  一条 1 像素的垂直线
 *
 *  @param orign  坐标
 *  @param height 高度
 *  @param color  颜色
 *
 *  @return 一条 1 像素的垂直线
 */
+ (UIView *)verticalLintWithOrign:(CGPoint)orign height:(CGFloat)height color:(UIColor *)color;
@end
