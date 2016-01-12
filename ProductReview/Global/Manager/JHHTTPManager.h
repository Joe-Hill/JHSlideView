//
//  JHHTTPHelper.h
//  grap-data
//
//  Created by Joe on 12/23/15.
//  Copyright © 2015 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHHTTPManager : NSObject

- (void)GET:(NSString *)url
     params:(NSDictionary *)params
    success:(void (^)(id JSON))success
    failure:(void (^)(NSError *error))failure;

- (void)POST:(NSString *)url
      params:(NSDictionary *)params
     success:(void (^)(id JSON))success
     failure:(void (^)(NSError *error))failure;

- (void)modifyHeaderWithParams:(NSDictionary *)params;

@end
