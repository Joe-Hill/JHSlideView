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
/**
 *  初始化 cell
 *
 *  @param tableView cell 父视图 tablView
 *
 *  @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
