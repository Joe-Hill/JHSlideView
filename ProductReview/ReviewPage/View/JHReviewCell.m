//
//  JHReviewCell.m
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHReviewCell.h"

#import "JHReview.h"
#import "JHReviewFrame.h"

#import "JHStarsView.h"
#import "JHPicturesView.h"

#import "UIImageView+WebImage.h"

@interface JHReviewCell ()
@property (nonatomic, strong) UIView         *reviewView;
@property (nonatomic, strong) UIImageView    *avatarView;
@property (nonatomic, strong) UILabel        *nameLabel;
@property (nonatomic, strong) JHStarsView    *rateView;
@property (nonatomic, strong) UILabel        *rateLabel;
@property (nonatomic, strong) UILabel        *contentLabel;
@property (nonatomic, strong) JHPicturesView *picturesView;
@property (nonatomic, strong) UILabel        *detailLabel;
@property (nonatomic, strong) UIView         *lineView;
@end

@implementation JHReviewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID   = @"review";
    JHReviewCell    *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JHReviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return self;
}

/**
 *  set reviewFraem 时创建视图，并赋予属性
 *
 *  @param reviewFrame reviewFrame 模型
 */
- (void)setReviewFrame:(JHReviewFrame *)reviewFrame {
    _reviewFrame = reviewFrame;
    JHReview *review = reviewFrame.review;

    self.reviewView.frame = reviewFrame.reviewViewFrame;
    //  头像
    self.avatarView.frame = reviewFrame.avatarViewFrame;
    [self.avatarView setWebImageWithURL:review.avatar placeHolder:@"avatar_default"];

    //  昵称
    self.nameLabel.frame = reviewFrame.nameLabelFrame;
    self.nameLabel.text  = review.userName;
    //  星
    self.rateView.frame = reviewFrame.rateViewFrame;
    self.rateView.score = review.rate;
    //  评分
    self.rateLabel.frame = reviewFrame.rateLabelFrame;
    self.rateLabel.text  = review.stringRate;
    //  评论内容
    self.contentLabel.frame = reviewFrame.contentLabelFrame;
    self.contentLabel.text  = review.content;
    //  配图
    if (review.pictures.count) {
        self.picturesView.frame    = reviewFrame.picturesViewFrame;
        self.picturesView.pictures = review.pictures;
        self.picturesView.hidden   = NO;
    } else {
        self.picturesView.hidden = YES;
    }
    //  评论内容
    self.detailLabel.frame = reviewFrame.detailLabelFrame;
    self.detailLabel.text  = review.detail;

    //  分割线
    self.lineView.frame = reviewFrame.lineViewFrame;
}

//#pragma mark - getters
- (UIView *)reviewView {
    if (_reviewView == nil) {
        _reviewView                 = [[UIView alloc] init];
        _reviewView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_reviewView];
    }
    return _reviewView;
}

- (UIImageView *)avatarView {
    if (_avatarView == nil) {
        _avatarView                    = [[UIImageView alloc] init];
        _avatarView.clipsToBounds      = YES;
        _avatarView.layer.cornerRadius = JHAvatarRadius;
        [_reviewView addSubview:_avatarView];
    }
    return _avatarView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel      = [[UILabel alloc] init];
        _nameLabel.font = JHReviewCellNameFont;
        [_reviewView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (JHStarsView *)rateView {
    if (_rateView == nil) {
        _rateView = [[JHStarsView alloc] init];
        [_reviewView addSubview:_rateView];
    }
    return _rateView;
}

- (UILabel *)rateLabel {
    if (_rateLabel == nil) {
        _rateLabel           = [[UILabel alloc] init];
        _rateLabel.font      = JHReviewCellRateFont;
        _rateLabel.textColor = JHDefaultColor;
        [_reviewView addSubview:_rateLabel];
    }
    return _rateLabel;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel               = [[UILabel alloc] init];
        _contentLabel.font          = JHReviewCellContentFont;
        _contentLabel.numberOfLines = 0;
        [_reviewView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (JHPicturesView *)picturesView {
    if (_picturesView == nil) {
        _picturesView = [[JHPicturesView alloc] init];
        [_reviewView addSubview:_picturesView];
    }
    return _picturesView;
}

- (UILabel *)detailLabel {
    if (_detailLabel == nil) {
        _detailLabel               = [[UILabel alloc] init];
        _detailLabel.numberOfLines = 0;
        _detailLabel.font          = JHReviewCellDetailFont;
        _detailLabel.textColor     = [UIColor grayColor];
        [_reviewView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [JHLineView lineWithStyle:JHLineViewStyleHorizon color:JHGrayColor];
        [_reviewView addSubview:_lineView];
    }
    return _lineView;
}

@end
