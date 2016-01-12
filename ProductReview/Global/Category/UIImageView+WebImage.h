//
//  UIImageView+WebImage.h
//  ProductReview
//
//  Created by Joe on 1/12/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebImage)
- (void)setWebImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder;
@end
