//
//  ViewController.m
//  RMCalendarView
//
//  Created by JianRongCao on 3/16/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+Calendar.h"

@interface ViewController ()
{
    NSDateFormatter *format;
    NSDate *selectMouth;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
//    NSMutableArray *days = [date showInViewDays];
//    [days enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%@",[format stringFromDate:obj]);
//    }];
//    
//    selectMouth = [date lastDayOfMouth];
//    DLog(@"%@",[format stringFromDate:selectMouth]);
    
    
    
    
    
    NSDate *date1 = [format dateFromString:[format stringFromDate:[NSDate date]]];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date2 = [format dateFromString:[format stringFromDate:[NSDate date]]];
    NSComparisonResult result = [date1 compare:date2];
    DLog(@"%d",result);
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    DLog(@"%@",[format stringFromDate:[selectMouth lastDayOfMouth]]);
    selectMouth = [NSDate dateWithTimeInterval:secondsOfDay sinceDate:[selectMouth lastDayOfMouth]];
//    selectMouth = [NSDate dateWithTimeInterval:-secondsOfDay sinceDate:[selectMouth firstDayOfMonth]];
    DLog(@"%@",[format stringFromDate:[selectMouth lastDayOfMouth]]);
    NSMutableArray *days = [selectMouth showInViewDays];
    [days enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"\n%@",[format stringFromDate:obj]);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
