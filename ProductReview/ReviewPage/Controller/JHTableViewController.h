//
//  JHTableViewController.h
//  ProductReview
//
//  Created by Joe on 1/13/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHTableViewController;

typedef NS_ENUM (NSInteger, JHSlideViewType){
    JHSlideViewTypeAll = 0,
    JHSlideViewTypePhoto,
    JHSlideViewTypeV2EX,
    JHSlideViewTypeNodeJS,
    JHSlideViewTypeTableView
};

@protocol JHTableViewControllerDelegate <NSObject>

@optional
/**
 *  JHTableViewController 请求到标题数组
 *
 *  @param controller 当前 JHTableViewController
 *  @param titles     请求的标题数组
 */
- (void)tableViewController:(JHTableViewController *)controller returnTitles:(NSDictionary *)titles;

@end

@interface JHTableViewController : UITableViewController

@property (nonatomic, assign) JHSlideViewType                 viewType;         /**< 当前 slideView 中 view 的类型 */
@property (nonatomic, strong) NSMutableDictionary             *params;          /**< 请求参数 */
@property (nonatomic, strong) NSMutableDictionary             *headerParams;    /**< 请求头消息参数 */
@property (nonatomic, weak) id<JHTableViewControllerDelegate> delegate;

/**
 *  以 JHSlideViewType 初始化
 *
 *  @param type slideView 中 view 的类型
 *
 *  @return JHTableViewController
 */
- (JHTableViewController *)initWithViewType:(JHSlideViewType)type;

/**
 *  请求普评论数据
 */
- (void)getReviews;

@end
