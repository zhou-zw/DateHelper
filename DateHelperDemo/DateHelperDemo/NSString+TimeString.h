//
//  NSString+TimeString.h
//  ShiJia
//
//  Created by zzw on 2017/9/12.
//  Copyright © 2017年 Ysten.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TimeString)

/**将时间戳转换为时间*/
+ (NSString *)stringWithTimeStamp:(NSNumber *)timeStamp;

@end
