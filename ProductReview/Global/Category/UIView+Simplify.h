//
//  UIView+Extension.h
//
//  Created by Joe on 10/23/15.
//  Copyright (c) 2015 Joe. All rights reserved.
//
//  直接调用 UIView 的 x y width height

#import <UIKit/UIKit.h>

@interface UIView (Simplify)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;


@end
