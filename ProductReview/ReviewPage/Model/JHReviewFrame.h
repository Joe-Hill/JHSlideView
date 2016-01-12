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
@property (nonatomic, strong) JHReview *review;
@property (nonatomic, assign) CGRect   avatarViewFrame;
@property (nonatomic, assign) CGRect   nameLabelFrame;
@property (nonatomic, assign) CGRect   rateViewFrame;
@property (nonatomic, assign) CGRect   rateLabelFrame;
@property (nonatomic, assign) CGRect   contentLabelFrame;
@property (nonatomic, assign) CGRect   picturesViewFrame;
@property (nonatomic, assign) CGRect   detailLabelFrame;
@property (nonatomic, assign) CGRect   reviewViewFrame;
@property (nonatomic, assign) CGRect   lineViewFrame;

@property (nonatomic, assign) CGFloat cellHeight;
@end
