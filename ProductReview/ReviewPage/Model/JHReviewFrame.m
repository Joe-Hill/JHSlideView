//
//  JHReviewFrame.m
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHReviewFrame.h"

#import "JHReview.h"
#import "JHPicturesView.h"

#import "NSString+Extension.h"

@implementation JHReviewFrame

/**
 *  在 set review 模型时，一次性提前计算好所有视图的 frame
 *
 *  @param review review 模型
 */
- (void)setReview:(JHReview *)review {
    _review = review;

    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat detailY   = 0;

    //  头像
    self.avatarViewFrame = CGRectMake(JH_REVIEWCELL_BOARDER, JH_REVIEWCELL_BOARDER, JH_AVATAR_SIDE, JH_AVATAR_SIDE);
    //  昵称
    CGSize  nameSize = [review.userName sizeWithFont:JH_REVIEWCELL_NAME_FONT maxWidth:MAXFLOAT];
    CGFloat nameX    = CGRectGetMaxX(self.avatarViewFrame) + JH_REVIEWCELL_GUTTER;
    CGFloat nameY    = CGRectGetMidY(self.avatarViewFrame) - nameSize.height * 0.5;
    self.nameLabelFrame = (CGRect){{nameX, nameY}, nameSize};

    //  分数
    CGSize  rateSize = [review.stringRate sizeWithFont:JH_REVIEWCELL_RATE_FONT maxWidth:MAXFLOAT];
    CGFloat rateX    = cellWidth - JH_REVIEWCELL_BOARDER - rateSize.width;
    CGFloat rateY    = CGRectGetMidY(self.avatarViewFrame) - rateSize.height * 0.5;
    self.rateLabelFrame = (CGRect){{rateX, rateY}, rateSize};
    //  星
    CGFloat rateViewX = rateX - JH_REVIEWCELL_GUTTER - JH_STAR_SIDE * 5;
    CGFloat rateViewY = CGRectGetMidY(self.avatarViewFrame) - JH_STAR_SIDE * 0.5;
    self.rateViewFrame = CGRectMake(rateViewX, rateViewY, 0, 0);
//    self.rateViewFrame = CGRectMake(rateViewX, rateViewY, arc4random_uniform(JH_STAR_SIDE * 5), 0);
    //  正文
    CGFloat contentX    = JH_REVIEWCELL_BOARDER;
    CGFloat contentY    = CGRectGetMaxY(self.avatarViewFrame) + JH_REVIEWCELL_GUTTER;
    CGFloat maxWidth    = cellWidth - 2 * contentX;
    CGSize  contentSize = [review.content sizeWithFont:JH_REVIEWCELL_CONTENT_FONT maxWidth:maxWidth];
    self.contentLabelFrame = (CGRect){{contentX, contentY}, contentSize};

    //  配图
    if (review.pictures.count) {    //  有配图
        CGFloat picturesX      = JH_REVIEWCELL_BOARDER;
        CGFloat picturesY      = CGRectGetMaxY(self.contentLabelFrame) + JH_REVIEWCELL_GUTTER;
        CGFloat picturesWidth  = cellWidth - JH_REVIEWCELL_BOARDER * 2;
        CGFloat picturesHeight = (picturesWidth - JH_REVIEWCELL_GUTTER * 3) * 0.25;
        self.picturesViewFrame = CGRectMake(picturesX, picturesY, picturesWidth, picturesHeight);
        detailY                = CGRectGetMaxY(self.picturesViewFrame) + JH_REVIEWCELL_GUTTER;

    } else {
        detailY = CGRectGetMaxY(self.contentLabelFrame) + JH_REVIEWCELL_GUTTER;
    }

    //  细节
    CGFloat detailX    = JH_REVIEWCELL_BOARDER;
    CGSize  detailSize = [review.detail sizeWithFont:JH_REVIEWCELL_DETAIL_FONT maxWidth:maxWidth];
    self.detailLabelFrame = (CGRect){{detailX, detailY}, detailSize};
    //  cell的高度
    self.cellHeight = CGRectGetMaxY(self.detailLabelFrame) + JH_REVIEWCELL_GUTTER;
    //  整体
    self.reviewViewFrame = CGRectMake(0, 0, cellWidth, self.cellHeight);
    //  分割线
    self.lineViewFrame = CGRectMake(0, self.cellHeight, cellWidth, 0);
}

@end
