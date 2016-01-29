//
//  UIImageView+WebImage.m
//  ProductReview
//
//  Created by Joe on 1/12/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "UIImageView+WebImage.h"

#import <YYWebImage.h>

@implementation UIImageView (WebImage)
- (void)setWebImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder {
    [self yy_setImageWithURL:[NSURL URLWithString:url]
                 placeholder:[UIImage imageNamed:placeHolder]
                     options:YYWebImageOptionSetImageWithFadeAnimation
                  completion:nil];
}

- (void)setWebImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder radius:(CGFloat)radius {
    [self setWebImageWithURL:url placeHolder:placeHolder];
    self.layer.cornerRadius = radius;
    self.clipsToBounds      = YES;
}

@end
