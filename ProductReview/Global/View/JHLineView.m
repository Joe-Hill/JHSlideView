//
//  JHLineView.m
//  ProductReview
//
//  Created by Joe on 1/13/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHLineView.h"

//  1 pixel line
#define SINGLE_LINE_ADJUST_OFFSET           SINGLE_LINE_WIDTH
#define SINGLE_LINE_WIDTH               (1 / [UIScreen mainScreen].scale)
//#define SINGLE_LINE_ADJUST_OFFSET       ((1 / [UIScreen mainScreen].scale) / 2)

//  1 point line
//#define SINGLE_LINE_WIDTH           1
//#define SINGLE_LINE_ADJUST_OFFSET   1

@implementation JHLineView
- (UIView *)initWithColor:(UIColor *)color {
    self = [super init];
    if (self) {
        self.backgroundColor = color;
    }
    return self;
}

- (UIView *)initWithFrame:(CGRect)frame color:(UIColor *)color {
    self       = [self initWithColor:color];
    self.frame = frame;
    return self;
}

- (UIView *)initWithStyle:(JHLineViewStyle)lineViewStyle color:(UIColor *)color {
    self               = [self initWithColor:color];
    self.lineViewStyle = lineViewStyle;
    return self;
}

- (void)setFrame:(CGRect)frame {
    if (self.lineViewStyle == JHLineViewStyleHorizon) {
        frame.origin.y   -= SINGLE_LINE_ADJUST_OFFSET;
        frame.size.height = SINGLE_LINE_WIDTH;
    } else if (self.lineViewStyle == JHLineViewStyleVertical) {
        frame.origin.x  -= SINGLE_LINE_ADJUST_OFFSET;
        frame.size.width = SINGLE_LINE_WIDTH;
    }
    [super setFrame:frame];
}

+ (UIView *)horizontalLintWithOrign:(CGPoint)orign width:(CGFloat)width color:(UIColor *)color {
    CGRect frame = CGRectMake(orign.x, orign.y - SINGLE_LINE_WIDTH, width, SINGLE_LINE_WIDTH);
    return [[self alloc] initWithFrame:frame color:color];
}

+ (UIView *)verticalLintWithOrign:(CGPoint)orign height:(CGFloat)height color:(UIColor *)color {
    CGRect frame = CGRectMake(orign.x - SINGLE_LINE_WIDTH, orign.y, SINGLE_LINE_WIDTH, height);
    return [[self alloc] initWithFrame:frame color:color];
}

+ (UIView *)lineWithStyle:(JHLineViewStyle)lineViewStyle color:(UIColor *)color {
    return [[self alloc] initWithStyle:lineViewStyle color:color];
}

@end
