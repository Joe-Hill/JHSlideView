//
//  NSString+Extension.m
//  Tool
//
//  Created by Joe on 7/2/15.
//  Copyright (c) 2015 Joe. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
//    return [self sizeWithAttributes:attrs];
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
