//
//  JHLog.h
//  ProductReview
//
//  Created by Joe on 1/21/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#ifndef JHLog_h
#define JHLog_h

#import <asl.h>
#define THIS_FILE [(@"" __FILE__) lastPathComponent]

#define _NSLog(fmt,...) {                                               \
do                                                                      \
{                                                                       \
NSString *str = [NSString stringWithFormat:fmt, ##__VA_ARGS__];         \
printf("%s\n",[str UTF8String]);                                        \
asl_log(NULL, NULL, ASL_LEVEL_NOTICE, "%s", [str UTF8String]);          \
}                                                                       \
while (0);                                                              \
}

#define NSLog(fmt, ...) _NSLog((@"%@:%d %s " fmt), THIS_FILE, __LINE__, __FUNCTION__, ##__VA_ARGS__)

#endif /* JHLog_h */
