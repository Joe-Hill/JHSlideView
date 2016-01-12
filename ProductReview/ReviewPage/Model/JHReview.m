//
//  JHReview.m
//  ProductReview
//
//  Created by Joe on 1/10/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#import "JHReview.h"

#import "JHPicture.h"

@interface JHReview ()
@end

@implementation JHReview

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    self.detail     = [NSString stringWithFormat:@"%@ %@ %@", self.cityName, self.skuDescription, self.createDate];
    self.stringRate = [NSString stringWithFormat:@"%0.1f", self.rate];
    NSMutableArray *mutablePictures = [NSMutableArray array];
    for (NSString *url in self.photos) {
        JHPicture *picture = [[JHPicture alloc] init];
        picture.picture = url;
        [mutablePictures addObject:picture];
    }
    self.pictures = [mutablePictures copy];
    return YES;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"createDate"      : @"addOn",
             @"userName"        : @"addBy"};
}

@end
