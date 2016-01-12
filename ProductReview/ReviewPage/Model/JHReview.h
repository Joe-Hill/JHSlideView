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

@property (nonatomic, strong) NSString             *content;
@property (nonatomic, strong) NSString             *createDate;
@property (nonatomic, strong) NSString             *userName;
@property (nonatomic, strong) NSString             *avatar;
@property (nonatomic, strong) NSString             *cityName;
@property (nonatomic, strong) NSString             *skuDescription;
@property (nonatomic, strong) NSString             *detail;
@property (nonatomic, strong) NSString             *stringRate;
@property (nonatomic, assign) CGFloat              rate;
@property (nonatomic, strong) NSArray<NSString *>  *photos;
@property (nonatomic, strong) NSArray<JHPicture *> *pictures;
@end
