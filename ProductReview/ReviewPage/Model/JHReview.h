//
//  JHReview.h
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHPicture;

@interface JHReview : NSObject

@property (nonatomic, strong) NSString             *content;            /**< 评论内容 */
@property (nonatomic, strong) NSString             *createDate;         /**< 创建时间 */
@property (nonatomic, strong) NSString             *userName;           /**< 创建者名称 */
@property (nonatomic, strong) NSString             *avatar;             /**< 头像地址 */
@property (nonatomic, strong) NSString             *cityName;           /**< 城市名称 */
@property (nonatomic, strong) NSString             *skuDescription;     /**< 购买品具体描述 */
@property (nonatomic, strong) NSString             *detail;             /**< 下方细节展示 */
@property (nonatomic, strong) NSString             *stringRate;         /**< 字符串评分 */
@property (nonatomic, assign) CGFloat              rate;                /**< 浮点型评分 */
@property (nonatomic, strong) NSArray<NSString *>  *photos;             /**< 评论图片字符串数组 */
@property (nonatomic, strong) NSArray<JHPicture *> *pictures;           /**< 评论图片模型数组 */
@end
