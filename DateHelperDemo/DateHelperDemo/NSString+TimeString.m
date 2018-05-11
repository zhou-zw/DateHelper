//
//  NSString+TimeString.m
//  ShiJia
//
//  Created by zzw on 2017/9/12.
//  Copyright © 2017年 Ysten.com. All rights reserved.
//

#define anHour  3600
#define aMinute 60

#import "NSString+TimeString.h"

@implementation NSString (TimeString)

+ (NSString *)stringWithTimeStamp:(NSNumber *)timeStamp {
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    //将当前时间转化为时间戳
    NSTimeInterval currentDateStamp = [currentDate timeIntervalSince1970];
    //将传入的参数转化为时间戳
    double dateStamp = [timeStamp doubleValue];
    //计算时间间隔，即当前时间减去传入的时间
    double interval = currentDateStamp - dateStamp;
    //获取当前时间的小时单位（24小时制）
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"H"];
    int nowHour = [[formatter stringFromDate:currentDate] intValue];
    //获取当前时间的分钟单位
    NSDateFormatter *minFormatter = [NSDateFormatter new];
    [minFormatter setDateFormat:@"m"];
    int nowMinute = [[minFormatter stringFromDate:currentDate] intValue];
    //今天0点的时间戳
    double todayZeroClock = currentDateStamp - anHour * nowHour - aMinute * nowMinute;
    //时间格式化，为输出做准备
    NSDateFormatter *outputFormat = [NSDateFormatter new];
    [outputFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDateFormatter *yestodayFormat = [NSDateFormatter new];
    [yestodayFormat setDateFormat:@"HH:mm:ss"];
    //进行条件判断，满足不同的条件返回不同的结果
    if (todayZeroClock - dateStamp > 24 * anHour) {
        //已经超过两天以上
        return [outputFormat stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateStamp]];
    } else if (todayZeroClock - dateStamp > 0) {
        //已经超过一天（昨天）
        return [NSString stringWithFormat:@"昨天%@",[yestodayFormat stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateStamp]]];
    } else if (interval < anHour) {
        //一个小时之内
        int time = (currentDateStamp - dateStamp) / aMinute;
        if (time == 0) {
            time = 1;
        }
        return [NSString stringWithFormat:@"%u分钟前", time];
    } else {
        //今天之内
        return [NSString stringWithFormat:@"%.0f小时前", (currentDateStamp - dateStamp) / anHour];
    }
}

@end
