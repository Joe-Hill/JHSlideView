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
@property(nonatomic, strong) JHSlideView           *slideView;
@property(nonatomic, strong) JHTableViewController *reviewController;
@property(nonatomic, strong) JHTableViewController *photoController;
@property (nonatomic, strong) WKWebView            *webView;
@end

@implementation ViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.view.tintColor = JH_DEFAULT_COLOR;

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
- (void)slideView:(JHSlideView *)slideView didMoveToEmptyPlaceHolderViewAtIndex:(NSInteger)index {
    switch (index) {
    default:
        break;
    case JHSlideViewTypePhoto: {
        [self.slideView loadView:self.photoController.tableView forPlaceHolderViewAtIndex:JHSlideViewTypePhoto];
        [self.photoController getReviews];
    } break;
    case JHSlideViewTypeV2EX: {
        WKWebView *webView = [[WKWebView alloc] init];
        webView.navigationDelegate = self;
        self.webView               = webView;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://v2ex.com/"]];
        [webView loadRequest:request];
        [self.slideView loadView:webView forPlaceHolderViewAtIndex:index];
    } break;
    case JHSlideViewTypeNodeJS: {
        WKWebView    *webView = [[WKWebView alloc] init];
        NSURLRequest *request = [NSURLRequest
                                 requestWithURL:[NSURL URLWithString:@"https://cnodejs.org/"]];
        [webView loadRequest:request];
        [self.slideView loadView:webView forPlaceHolderViewAtIndex:index];
    } break;
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [_webView evaluateJavaScript:@"document.getElementById('Top').offsetWidth" completionHandler:^(id _Nullable result, NSError *_Nullable error) {
//         NSLog(@"%@", result);
//         NSLog(@"%@", error);
     }];
}

#pragma mark JHTableViewControllerDelegate
- (void)tableViewController:(JHTableViewController *)controller
               returnTitles:(NSDictionary *)titles {
    [self.slideView modifyTitle:[NSString stringWithFormat:@"全部(%@)", titles[@"countAll"]]   atIndex:0];
    [self.slideView modifyTitle:[NSString stringWithFormat:@"图片(%@)", titles[@"countPhoto"]] atIndex:1];
}

#pragma mark - getters
- (JHSlideView *)slideView {
    if (_slideView == nil) {
        CGFloat navigationMaxY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        _slideView          = [JHSlideView viewWithFrame:CGRectMake(0, self.view.y + navigationMaxY, self.view.width, self.view.height - navigationMaxY) titles:@[ @"全部", @"有图", @"V2EX", @"NodeJS"]];
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
        [self addChildViewController:_photoController];
    }
    return _photoController;
}

@end
