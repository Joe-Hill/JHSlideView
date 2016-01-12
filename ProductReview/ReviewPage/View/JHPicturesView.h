//
//  JHPicturesView.h
//  ProductReview
//
//  Created by Joe on 1/12/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JHPicture;

@interface JHPicturesView : UIView
@property (nonatomic, strong) NSArray<JHPicture *> *pictures;
@end
