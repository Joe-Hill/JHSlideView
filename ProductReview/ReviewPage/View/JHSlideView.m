//
//  JHSlideView.m
//  ProductReview
//
//  Created by Joe on 1/9/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHSlideView.h"
#import "JHPageView.h"

#define JHTabBarHeight 42

@interface JHSlideView ()
@property (nonatomic, assign) NSUInteger          pageCount;            /**< 创建的总页数 */
@property (nonatomic, strong) NSArray<NSString *> *titiles;             /**< 标题数组 */
@property (nonatomic, strong) JHTabBar            *tabBar;              /**< 上方按钮栏 */
@property (nonatomic, strong) JHPageView          *pageView;            /**< 下方滚动视图 */
@end

@implementation JHSlideView

#pragma mark - inittialization
- (JHSlideView *)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        self.pageCount = titles.count;
        self.titiles   = titles;
        [self addSubview:self.tabBar];
        [self addSubview:self.pageView];

        [self scrollViewDidEndDecelerating:self.pageView];
    }
    return self;
}

+ (JHSlideView *)viewWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles {
    return [[self alloc] initWithFrame:frame titles:titles];
}

#pragma mark - private methods
- (void)loadView:(UIView *)view forPlaceHolderViewAtIndex:(NSInteger)index {
    [self.pageView initPlaceHolderViewWithView:view atIndex:index];
}

- (void)modifyTitle:(NSString *)title atIndex:(NSInteger)index {
    [self.tabBar modifyTitle:title atIndex:index];
}

#pragma mark - delegates
#pragma mark JHTabBar delegate
- (void)tabBar:(JHTabBar *)tabBar didClickButton:(UIButton *)button index:(NSInteger)index {
//    NSInteger currentIndex  = self.pageView.contentOffset.x / self.width;
//    self.pageView.contentOffset = CGPointMake(self.width * index, 0);
    [self.pageView setContentOffset:CGPointMake(self.width * index, 0) animated:YES];
}

#pragma mark UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%s", __func__);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index   = self.pageView.contentOffset.x / self.width;
    BOOL      isEmpty = !self.pageView.placeHolderViews[index].subviews.count;
    if ([self.delegete respondsToSelector:@selector(slideView:didMoveToPlaceHolderViewAtIndex:)]) {
        [self.delegete slideView:self didMoveToPlaceHolderViewAtIndex:index];
    }
    if (isEmpty) {
        if ([self.delegete respondsToSelector:@selector(slideView:didMoveToEmptyPlaceHolderViewAtIndex:)]) {
            [self.delegete slideView:self didMoveToEmptyPlaceHolderViewAtIndex:index];
        }
    }
    [self.tabBar clickButtonAtIndex:index];
}

#pragma mark - getters
- (JHTabBar *)tabBar {
    if (_tabBar == nil) {
        _tabBar          = [JHTabBar tabBarWithFrame:CGRectMake(0, 0, self.width, JHTabBarHeight)  titles:self.titiles];
        _tabBar.delegate = self;
    }
    return _tabBar;
}

- (JHPageView *)pageView {
    if (_pageView == nil) {
        _pageView          = [JHPageView pageViewWithFrame:CGRectMake(0, JHTabBarHeight, self.width, self.height - JHTabBarHeight) pageCount:self.pageCount];
        _pageView.delegate = self;
//        self.placeHolderViews = _pageView.placeHolderViews;
    }
    return _pageView;
}

@end
