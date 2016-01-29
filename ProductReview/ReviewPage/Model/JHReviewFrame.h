//
//  JHReviewFrame.h
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JH_REVIEWCELL_BOARDER           17
#define JH_AVATAR_SIDE                  30
#define JH_AVATAR_RADIUS                JH_AVATAR_SIDE * 0.5
#define JH_STAR_SIDE                    13
#define JH_REVIEWCELL_NAME_FONT         [UIFont systemFontOfSize:14]
#define JH_REVIEWCELL_RATE_FONT         [UIFont systemFontOfSize:14]
#define JH_REVIEWCELL_CONTENT_FONT      [UIFont systemFontOfSize:15]
#define JH_REVIEWCELL_DETAIL_FONT       [UIFont systemFontOfSize:11]


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
