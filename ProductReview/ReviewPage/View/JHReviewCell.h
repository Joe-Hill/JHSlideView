//
//  JHReviewCell.h
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHReviewFrame;

@interface JHReviewCell : UITableViewCell
@property (nonatomic, strong) JHReviewFrame *reviewFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
