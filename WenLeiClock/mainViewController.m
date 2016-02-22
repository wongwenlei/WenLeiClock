//
//  mainViewController.m
//  WenLeiClock
//
//  Created by Willei Wang on 16/2/22.
//  Copyright © 2016年 WenLei Wang. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()
@property (strong, nonatomic) IBOutlet UILabel *clockLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self myTimerAction];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    //刷新时间
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(myTimerAction) userInfo:nil repeats:YES];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer forMode:UITrackingRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//获取时间
-(void)myTimerAction
{
    //    NSLocale *tzone = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    //    NSLocale *tzone1 = [NSLocale currentLocale];
    //    NSLocale *tzone2 = [NSLocale systemLocale];
    NSDate *date1 = [NSDate date];
    NSDate *date2 = [NSDate date];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter1 setDateFormat:@"MM/dd  EEEE"];
    [dateFormatter2 setDateFormat:@"EEE"];
    
    NSString *times = [dateFormatter stringFromDate:date1];
    NSString *calendar = [dateFormatter1 stringFromDate:date2];
    
    self.clockLabel.text =times;
    self.dateLabel.text = calendar;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
