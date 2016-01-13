//
//  NSString+Extension.h
//  Tool
//
//  Created by Joe on 7/2/15.
//  Copyright (c) 2015 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  计算文字的 CGSize
 *
 *  @param font     文字的字体
 *  @param maxWidth 文字的最大宽度
 *
 *  @return CGSize
 */
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;
@end
