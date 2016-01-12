//
//  UIBarButtonItem+Extension.m
//
//
//  Created by Joe on 10/24/15.
//  Copyright (c) 2015 Joe. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  创建一个item
 *
 *  @param target           调用对象
 *  @param action           点击item调用方法
 *  @param image            图片
 *  @param highlightedImage 高亮图片
 *
 *  @return 创建完毕的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage {
    //  设置图片
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    //  设置尺寸
    btn.size = btn.currentImage.size;

    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
