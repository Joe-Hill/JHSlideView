//
//  JHReviewFrame.h
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JHReviewCellBoarder         17
#define JHAvatarSide                30
#define JHAvatarRadius              JHAvatarSide * 0.5
#define JHStarSide                  13
#define JHReviewCellNameFont        [UIFont systemFontOfSize:14]
#define JHReviewCellRateFont        [UIFont systemFontOfSize:14]
#define JHReviewCellContentFont     [UIFont systemFontOfSize:15]
#define JHReviewCellDetailFont      [UIFont systemFontOfSize:11]


@class JHReview;

@interface JHReviewFrame : NSObject
@property (nonatomic, strong) JHReview *review;                 /**< review 模型 */
@property (nonatomic, assign) CGRect   avatarViewFrame;         /**< 头像 frame */
@property (nonatomic, assign) CGRect   nameLabelFrame;          /**< 名称 label frame */
@property (nonatomic, assign) CGRect   rateViewFrame;           /**< 评分星 frame */
@property (nonatomic, assign) CGRect   rateLabelFrame;          /**< 评分 label frame */
@property (nonatomic, assign) CGRect   contentLabelFrame;       /**< 评价内容 frame */
@property (nonatomic, assign) CGRect   picturesViewFrame;       /**< 评价配图 frame */
@property (nonatomic, assign) CGRect   detailLabelFrame;        /**< 具体信息 frame */
@property (nonatomic, assign) CGRect   reviewViewFrame;         /**< 整体评论视图 frame */
@property (nonatomic, assign) CGRect   lineViewFrame;           /**< 分割线 frame */

@property (nonatomic, assign) CGFloat cellHeight;               /**< cell 高度 */
@end
