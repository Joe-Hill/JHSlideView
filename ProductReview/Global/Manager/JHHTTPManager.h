//
//  JHHTTPHelper.h
//  grap-data
//
//  Created by Joe on 12/23/15.
//  Copyright © 2015 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHHTTPManager : NSObject

/**
 *  GET 方法
 *
 *  @param url     请求地址
 *  @param params  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)GET:(NSString *)url
     params:(NSDictionary *)params
    success:(void (^)(id JSON))success
    failure:(void (^)(NSError *error))failure;
/**
 *  POST 方法
 *
 *  @param url     请求地址
 *  @param params  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)POST:(NSString *)url
      params:(NSDictionary *)params
     success:(void (^)(id JSON))success
     failure:(void (^)(NSError *error))failure;

/**
 *  编辑头文消息参数
 *
 *  @param params 参数
 */
- (void)modifyHeaderWithParams:(NSDictionary *)params;

@end
