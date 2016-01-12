//
//  JHTableViewController.m
//  ProductReview
//
//  Created by Joe on 1/13/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHTableViewController.h"

#import "JHReviewCell.h"

#import "JHReview.h"
#import "JHReviewFrame.h"

#import "JHHTTPManager.h"
#import <YYModel.h>
#import <MJRefresh.h>

@interface JHTableViewController ()
@property (nonatomic, strong) NSMutableArray *reviewFrames;
@property (nonatomic, assign) NSInteger      reviewsViewPageCount;
@property (nonatomic, assign) BOOL           isLoadingMoreReviews;          /**< 判断是否在读取更多数据 */
@end

@implementation JHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = JHGrayColor;
    self.tableView.separatorStyle  = NO;
}

- (JHTableViewController *)initWithViewType:(JHSlideViewType)type {
    self = [super init];
    if (self) {
        self.viewType             = type;
        self.params[@"onlyPhoto"] = [NSString stringWithFormat:@"%zd", type];
    }
    return self;
}

- (void)getReviews {
    self.params[@"page"]      = @"0";
    self.reviewsViewPageCount = 0;

    JHHTTPManager *manager = [[JHHTTPManager alloc] init];
    [manager modifyHeaderWithParams:self.headerParams];

    [manager GET:@"https://api.octinn.com/store/goods/11869/comments/" params:self.params success:^(id JSON) {
         if ([self.delegate respondsToSelector:@selector(tableViewController:returnTitles:)]) {
             [self.delegate tableViewController:self returnTitles:JSON[@"current"][@"count"]];
         }
         NSArray *newReviews = [NSArray yy_modelArrayWithClass:[JHReview class] json:JSON[@"current"][@"items"]];
         if (newReviews.count) {
             NSArray *newReviewFrames = [self reviewFramesWithReviews:newReviews];
             NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newReviews.count)];
             [self.reviewFrames insertObjects:newReviewFrames atIndexes:set];
             [self.tableView reloadData];
             self.params[@"page"] = @"1";
             self.reviewsViewPageCount = 1;
         }
     } failure:^(NSError *error) {
     }];
}

- (void)loadMoreReviews {
    self.isLoadingMoreReviews = YES;
    JHHTTPManager *manager = [[JHHTTPManager alloc] init];
    [manager modifyHeaderWithParams:self.headerParams];

    [manager GET:@"https://api.octinn.com/store/goods/11869/comments/" params:self.params success:^(id JSON) {
         //         NSLog(@"%zd", self.reviewFrames.count);
         NSArray *newReviews = [NSArray yy_modelArrayWithClass:[JHReview class] json:JSON[@"current"][@"items"]];
         if (newReviews.count) {
             NSArray *newReviewFrames = [self reviewFramesWithReviews:newReviews];
             [self.reviewFrames addObjectsFromArray:newReviewFrames];
             [self.tableView reloadData];
             self.params [@"page"] = [NSString stringWithFormat:@"%zd", ++self.reviewsViewPageCount];
             self.isLoadingMoreReviews = NO;
         }
     } failure:^(NSError *error) {
         self.isLoadingMoreReviews = NO;
     }];
}

#pragma mark - private methods
- (NSArray *)reviewFramesWithReviews:(NSArray *)reviews {
    NSMutableArray *frames = [NSMutableArray array];
    for (JHReview *review in reviews) {
        JHReviewFrame *frame = [[JHReviewFrame alloc] init];
        frame.review = review;
        [frames addObject:frame];
    }
    return frames;
}

#pragma mark UITableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reviewFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JHReviewCell *cell = [JHReviewCell cellWithTableView:tableView];
    cell.reviewFrame = self.reviewFrames[indexPath.row];
    return cell;
}

#pragma mark UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JHReviewFrame *frame = self.reviewFrames[indexPath.row];
    return frame.cellHeight;
}

#pragma mark UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 如果tableView还没有数据，就直接返回
    if (self.reviewFrames.count == 0 || self.isLoadingMoreReviews == YES) return;
    CGFloat offsetY = scrollView.contentOffset.y;
    // 当最后一个cell完全显示在眼前时，contentOffset的y值
    CGFloat judgeOffsetY = scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.height;
    if (offsetY >= judgeOffsetY) { // 最后一个cell完全进入视野范围内
        [self loadMoreReviews];
    }
}

#pragma mark - getters
- (NSMutableArray *)reviewFrames {
    if (_reviewFrames == nil) {
        _reviewFrames = [NSMutableArray array];
    }
    return _reviewFrames;
}

- (NSMutableDictionary *)params {
    if (_params == nil) {
        _params            = [NSMutableDictionary dictionary];
        _params[@"cityId"] = @"110100";
        _params[@"limit"]  = @"10";
    }
    return _params;
}

- (NSMutableDictionary *)headerParams {
    if (_headerParams == nil) {
        _headerParams               = [[NSMutableDictionary alloc] init];
        _headerParams[@"OI-APPKEY"] = @"43c96e78269670c5099e8db0797be5b7";
        _headerParams[@"OI-APIVER"] = @"21";
    }
    return _headerParams;
}

@end
