//
//  NSDate+Calendar.h
//  RMCalendarView
//
//  Created by JianRongCao on 3/16/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Calendar)

/*! 返回一个NSDateComponents对象   里面跨月获取到年月日时分秒和周几*/
- (NSDateComponents *)detailInfo;

/*! 某一个月有多少天*/
- (NSInteger)totalDaysInMouth;

/*! 某一个月的第一天*/
- (NSDate *)firstDayOfMonth;

/*! 某一个月的最后一天*/
- (NSDate *)lastDayOfMouth;

/*! 某一个月的所有日期*/
- (NSMutableArray *)showInViewDays;

@end
