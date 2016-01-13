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
    self.avatarViewFrame = CGRectMake(JHReviewCellBoarder, JHReviewCellBoarder, JHAvatarSide, JHAvatarSide);
    //  昵称
    CGSize  nameSize = [review.userName sizeWithFont:JHReviewCellNameFont maxWidth:MAXFLOAT];
    CGFloat nameX    = CGRectGetMaxX(self.avatarViewFrame) + JHReviewCellGutter;
    CGFloat nameY    = CGRectGetMidY(self.avatarViewFrame) - nameSize.height * 0.5;
    self.nameLabelFrame = (CGRect){{nameX, nameY}, nameSize};

    //  分数
    CGSize  rateSize = [review.stringRate sizeWithFont:JHReviewCellRateFont maxWidth:MAXFLOAT];
    CGFloat rateX    = cellWidth - JHReviewCellBoarder - rateSize.width;
    CGFloat rateY    = CGRectGetMidY(self.avatarViewFrame) - rateSize.height * 0.5;
    self.rateLabelFrame = (CGRect){{rateX, rateY}, rateSize};
    //  星
    CGFloat rateViewX = rateX - JHReviewCellGutter - JHStarSide * 5;
    CGFloat rateViewY = CGRectGetMidY(self.avatarViewFrame) - JHStarSide * 0.5;
    self.rateViewFrame = CGRectMake(rateViewX, rateViewY, 0, 0);
    //  正文
    CGFloat contentX    = JHReviewCellBoarder;
    CGFloat contentY    = CGRectGetMaxY(self.avatarViewFrame) + JHReviewCellGutter;
    CGFloat maxWidth    = cellWidth - 2 * contentX;
    CGSize  contentSize = [review.content sizeWithFont:JHReviewCellContentFont maxWidth:maxWidth];
    self.contentLabelFrame = (CGRect){{contentX, contentY}, contentSize};

    //  配图
    if (review.pictures.count) {    //  有配图
        CGFloat picturesX      = JHReviewCellBoarder;
        CGFloat picturesY      = CGRectGetMaxY(self.contentLabelFrame) + JHReviewCellGutter;
        CGFloat picturesWidth  = cellWidth - JHReviewCellBoarder * 2;
        CGFloat picturesHeight = (picturesWidth - JHReviewCellGutter * 3) * 0.25;
        self.picturesViewFrame = CGRectMake(picturesX, picturesY, picturesWidth, picturesHeight);
        detailY                = CGRectGetMaxY(self.picturesViewFrame) + JHReviewCellGutter;

    } else {
        detailY = CGRectGetMaxY(self.contentLabelFrame) + JHReviewCellGutter;
    }

    //  细节
    CGFloat detailX    = JHReviewCellBoarder;
    CGSize  detailSize = [review.detail sizeWithFont:JHReviewCellContentFont maxWidth:maxWidth];
    self.detailLabelFrame = (CGRect){{detailX, detailY}, detailSize};
    //  cell的高度
    self.cellHeight = CGRectGetMaxY(self.detailLabelFrame) + JHReviewCellGutter;
    //  整体
    self.reviewViewFrame = CGRectMake(0, 0, cellWidth, self.cellHeight);
    //  分割线
    self.lineViewFrame = CGRectMake(0, self.cellHeight, cellWidth, 0);
}

@end
