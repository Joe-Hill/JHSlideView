//
//  ViewController.m
//  ProductReview
//
//  Created by Joe on 1/8/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "ViewController.h"

#import "UIBarButtonItem+Extension.h"
#import "JHHTTPManager.h"

@interface ViewController ()
@property (nonatomic, strong) JHSlideView           *slideView;
@property (nonatomic, strong) JHTableViewController *reviewController;
@property (nonatomic, strong) JHTableViewController *photoController;
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.view.tintColor = JHDefaultColor;

    [self.view addSubview:self.slideView];
    [self.slideView loadView:self.reviewController.tableView forPlaceHolderViewAtIndex:JHSlideViewTypeAll];
    [self.reviewController getReviews];
}

#pragma mark - event response
- (IBAction)reviewsGoBack:(id)sender {
    NSLog(@"%s", __func__);
}

- (IBAction)reviewsLoadMore:(id)sender {
    NSLog(@"%s", __func__);
}

#pragma mark - delegates
#pragma mark JHSlideView delegate
- (void)slideView:(JHSlideView *)slideView didMoveToEmptyPlaceHolderViewAtIndex:(NSInteger)index  {
    switch (index) {
    default:
        break;
    case JHSlideViewTypePhoto: {
        [self.slideView loadView:self.photoController.tableView forPlaceHolderViewAtIndex:JHSlideViewTypePhoto];
        [self.photoController getReviews];
    }
    break;
    case JHSlideViewTypeApple: {
        UIWebView *webView = [[UIWebView alloc] init];
        webView.delegate = self;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://leancloud.cn/"]];
        [webView loadRequest:request];
        [self.slideView loadView:webView forPlaceHolderViewAtIndex:index];

    }
    break;
    case JHSlideViewTypeReactJS: {
        UIWebView *webView = [[UIWebView alloc] init];
        webView.delegate = self;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.reactjs-china.com/"]];
        [webView loadRequest:request];
        [self.slideView loadView:webView forPlaceHolderViewAtIndex:index];
    }
    break;
    }
}

#pragma mark JHTableViewControllerDelegate
- (void)tableViewController:(JHTableViewController *)controller returnTitles:(NSDictionary *)titles {
    [self.slideView modifyTitle:[NSString stringWithFormat:@"全部(%@)", titles[@"countAll"]] atIndex:0];
    [self.slideView modifyTitle:[NSString stringWithFormat:@"图片(%@)", titles[@"countPhoto"]] atIndex:1];
}

#pragma mark - getters
- (JHSlideView *)slideView {
    if (_slideView == nil) {
        CGFloat navigationMaxY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        _slideView          = [JHSlideView viewWithFrame:CGRectMake(0, self.view.y + navigationMaxY, self.view.width, self.view.height - navigationMaxY) titles:@[@"全部", @"有图", @"Leancloud", @"ReactJS"]];
        _slideView.delegete = self;
    }
    return _slideView;
}

- (JHTableViewController *)reviewController {
    if (_reviewController == nil) {
        _reviewController          = [[JHTableViewController alloc] initWithViewType:JHSlideViewTypeAll];
        _reviewController.delegate = self;
        [self addChildViewController:_reviewController];
    }
    return _reviewController;
}

- (JHTableViewController *)photoController {
    if (_photoController == nil) {
        _photoController = [[JHTableViewController alloc] initWithViewType:JHSlideViewTypePhoto];
        [self addChildViewController:self.photoController];
        self.reviewController = self.photoController;
    }
    return _photoController;
}

@end
