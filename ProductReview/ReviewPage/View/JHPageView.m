//
//  JHPageView.m
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHPageView.h"

@interface JHPageView ()

@property (nonatomic, strong) NSMutableArray<UIView *> *privatePlaceHolderViews;

@end

@implementation JHPageView
#pragma mark - initialization
- (JHPageView *)initWithFrame:(CGRect)frame pageCount:(NSUInteger)pageCount {
    self = [super initWithFrame:frame];
    NSMutableArray *placeHolderViews = [NSMutableArray array];
    if (self) {
        CGFloat width  = frame.size.width;
        CGFloat height = frame.size.height;
        self.contentSize                    = CGSizeMake(width * pageCount, height);
        self.pagingEnabled                  = YES;
        self.bounces                        = NO;
        self.showsVerticalScrollIndicator   = NO;
        self.showsHorizontalScrollIndicator = NO;
        for (int i = 0; i < pageCount; i++) {
            UIView *placeHolderView = [[UIView alloc] initWithFrame:CGRectMake(width *i, 0, width, height)];
            [self addSubview:placeHolderView];
            [placeHolderViews addObject:placeHolderView];
        }
        self.privatePlaceHolderViews = [placeHolderViews copy];
    }
    return self;
}

/** 初始化 JHPageView */
+ (JHPageView *)pageViewWithFrame:(CGRect)frame pageCount:(NSUInteger)pageCount {
    return [[self alloc] initWithFrame:frame pageCount:(NSUInteger)pageCount];
}

#pragma mark - private methods
/** 为 placeHolderView 加载实际内容 */
- (void)initPlaceHolderViewWithView:(UIView *)view atIndex:(NSInteger)index {
    view.frame = CGRectMake(0, 0, self.width, self.height);
    [self.privatePlaceHolderViews[index] addSubview:view];
}

#pragma mark - getters
- (NSArray<UIView *> *)placeHolderViews {
    return _privatePlaceHolderViews = [self.privatePlaceHolderViews copy];
}

@end
