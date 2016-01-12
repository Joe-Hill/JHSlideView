//
//  JHPicturesView.m
//  ProductReview
//
//  Created by Joe on 1/12/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHPicturesView.h"

#import "JHPicture.h"

#import "UIImageView+WebImage.h"

@interface JHPicturesView ()
@property (nonatomic, assign) NSInteger picturesCount;
@property (nonatomic, assign) CGFloat   pictureSide;
@end

@implementation JHPicturesView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.pictureSide = frame.size.height;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //  设置图片的尺寸和位置
    for (int i = 0; i < self.picturesCount; i++) {
        UIImageView *pictureView = self.subviews[i];
        pictureView.x      = (self.pictureSide + JHReviewCellGutter) * i;
        pictureView.y      = 0;
        pictureView.width  = self.pictureSide;
        pictureView.height = self.pictureSide;
    }
}

- (void)setPictures:(NSArray<JHPicture *> *)pictures {
    _pictures          = pictures;
    self.picturesCount = pictures.count;

    while (self.subviews.count < self.picturesCount) {
        UIImageView *pictureView = [[UIImageView alloc] init];
        pictureView.contentMode        = UIViewContentModeScaleAspectFill;
        pictureView.clipsToBounds      = YES;
        pictureView.layer.cornerRadius = 3;
        [self addSubview:pictureView];
    }

    //  遍历所有图片控件, 设置图片
    for (int i = 0; i < self.subviews.count; i++) {
        UIImageView *pictureView = self.subviews[i];
        if (i < self.picturesCount) {   //  显示
            [pictureView setWebImageWithURL:pictures[i].picture placeHolder:@"imagePlaceholder"];
            pictureView.hidden = NO;
        } else { //  隐藏
            pictureView.hidden = YES;
        }
    }
}

@end
