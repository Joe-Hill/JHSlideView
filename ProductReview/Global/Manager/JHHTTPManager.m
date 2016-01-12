//
//  JHHTTPHelper.m
//  grap-data
//
//  Created by Joe on 12/23/15.
//  Copyright © 2015 Joe. All rights reserved.
//

#import "JHHTTPManager.h"

#import <AFNetworking.h>

typedef NS_ENUM (NSUInteger, JHHTTPRequestType) {
    JHHTTPRequestTypeGET = 0,
    JHHTTPRequestTypePOST
};


@interface JHHTTPManager ()
@property (nonatomic, strong) NSDictionary *headerParams;
@end

@implementation JHHTTPManager

- (void)modifyHeaderWithParams:(NSDictionary *)params {
    self.headerParams = params;
}

- (void)requestWithURL:(NSString *)url
                  type:(JHHTTPRequestType)type
                params:(NSDictionary *)params
               success:(void (^)(id))success
               failure:(void (^)(NSError *))failure {

    //  1. 创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer                        = [AFJSONResponseSerializer serializer];
    manager.securityPolicy.allowInvalidCertificates   = YES;
    manager.securityPolicy.validatesDomainName        = NO;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    //  2. 修改头文件
    if (self.headerParams) {
        for (id key in self.headerParams) {
            NSString *param = [self.headerParams valueForKey:key];
            [manager.requestSerializer setValue:param forHTTPHeaderField:key];
        }
    }
    //  3. 发送请求
    if (type == JHHTTPRequestTypeGET) {
        [manager GET:url parameters:params progress:^(NSProgress *_Nonnull downloadProgress) {
         } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
             if (success) {
                 success(responseObject);
             }
         } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
             if (failure) {
                 failure(error);
             }
         }];
    } else if (type == JHHTTPRequestTypePOST) {
        [manager POST:url parameters:params progress:^(NSProgress *_Nonnull uploadProgress) {
         } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
             if (success) {
                 success(responseObject);
             }
         } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
             if (failure) {
                 failure(error);
             }
         }];
    }

}

/** get 请求 */
- (void)GET:(NSString *)url
     params:(NSDictionary *)params
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure {

    [self requestWithURL:url type:JHHTTPRequestTypeGET params:params success:success failure:failure];
}

/** post 请求 */
- (void)POST:(NSString *)url
      params:(NSDictionary *)params
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure {

    [self requestWithURL:url type:JHHTTPRequestTypePOST params:params success:success failure:failure];
}

@end
