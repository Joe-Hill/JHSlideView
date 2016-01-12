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
    JHSlideViewTypeApple,
    JHSlideViewTypeReactJS
};

@protocol JHTableViewControllerDelegate <NSObject>

@optional
- (void)tableViewController:(JHTableViewController *)controller returnTitles:(NSDictionary *)titles;

@end

@interface JHTableViewController : UITableViewController

@property (nonatomic, assign) JHSlideViewType                 viewType;
@property (nonatomic, strong) NSMutableDictionary             *params;
@property (nonatomic, strong) NSMutableDictionary             *headerParams;
@property (nonatomic, weak) id<JHTableViewControllerDelegate> delegate;

- (JHTableViewController *)initWithViewType:(JHSlideViewType)type;
- (void)getReviews;

@end
