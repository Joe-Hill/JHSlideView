//
//  UIBarButtonItem+Extension.h
//
//
//  Created by Joe on 10/24/15.
//  Copyright (c) 2015 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage;

@end
