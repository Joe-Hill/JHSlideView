//
//  UIBarButtonItem+Extension.h
//
//
//  Created by Joe on 10/24/15.
//  Copyright (c) 2015 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  navigation 中的 buttonItem 设置
 *
 *  @param target           目标
 *  @param action           方法
 *  @param image            非点击图片
 *  @param highlightedImage 点击图片
 *
 *  @return buttonItem
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage;

@end
