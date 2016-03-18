//
//  NSDate+Calendar.m
//  RMCalendarView
//
//  Created by JianRongCao on 3/16/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "NSDate+Calendar.h"

@implementation NSDate (Calendar)

- (NSDateComponents *)detailInfo
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unit fromDate:self];
    return components;
}

- (NSInteger)totalDaysInMouth
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return range.length;
}

- (NSDate *)firstDayOfMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *components = [calendar components:unit fromDate:self];
    components.day = 1;
    NSDate *firstDay = [calendar dateFromComponents:components];
    return firstDay;
}

- (NSDate *)lastDayOfMouth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *components = [calendar components:unit fromDate:self];
    components.day = [self totalDaysInMouth];
    NSDate *lastDay = [calendar dateFromComponents:components];
    return lastDay;
}

- (NSMutableArray *)showInViewDays
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSInteger total = [self totalDaysInMouth];
    NSDate *date = [self firstDayOfMonth];
    for (int idx = 0; idx < total; idx++) {
        NSDate *joinDate = [NSDate dateWithTimeInterval:idx * secondsOfDay  sinceDate:date];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        [array addObject:joinDate];
    }
    
    for (int idx = 1; idx < [date detailInfo].weekday; idx++) {
        NSDate *joinDate = [NSDate dateWithTimeInterval:-idx * secondsOfDay  sinceDate:date];
        [array insertObject:joinDate atIndex:0];
    }
    
    NSInteger lastWeek = [[self lastDayOfMouth] detailInfo].weekday;
    for (int idx = 0; idx <= (6 - lastWeek); idx++) {
        NSDate *joinDate = [NSDate dateWithTimeInterval:(idx + total) * secondsOfDay  sinceDate:date];
        [array addObject:joinDate];
    }

    return array;
}

@end
