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
+ (UIView *)lineWithStyle:(JHLineViewStyle)lineViewStyle color:(UIColor *)color;
+ (UIView *)horizontalLintWithOrign:(CGPoint)orign width:(CGFloat)width color:(UIColor *)color;
+ (UIView *)verticalLintWithOrign:(CGPoint)orign height:(CGFloat)height color:(UIColor *)color;
@end
