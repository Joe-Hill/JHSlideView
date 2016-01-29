//
//  UIImageView+WebImage.h
//  ProductReview
//
//  Created by Joe on 1/12/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebImage)
/**
 *  异步加载网络图片
 *
 *  @param url         网络图片地址
 *  @param placeHolder 占位图路径
 */
- (void)setWebImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder;

/**
 *  异步加载网络图片
 *
 *  @param url         网络图片地址
 *  @param placeHolder 占位图路径
 *  @param radius      图片圆角
 */
- (void)setWebImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder radius:(CGFloat)radius;
@end
