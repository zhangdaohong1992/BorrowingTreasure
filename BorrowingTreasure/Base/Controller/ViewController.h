//
//  ViewController.h
//  Treasure
//
//  Created by 苹果 on 15/10/19.
//  Copyright (c) 2015年 YDS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNetworkModel.h"


// All of your controller should be subclass of ViewController or BaseTableViewController. cuz i had packaged the base method of network.And the needed method sometimes;

@interface ViewController : UIViewController<BaseNetworkDelegate>

//the network started
@property (nonatomic, strong) BaseNetworkModel * network;
@property (nonatomic, strong) UILabel * noMoreDataLabel;

- (void)successfulWithDic:(NSDictionary *)dic method:(NSString *)method;

- (void)login;
- (BOOL)isPostSuccessedWithDic:(NSDictionary *)dic;
- (void)masksRadius:(UIView *)view1 numRadius:(float)floatNum;//做圆角

- (void) shakeToShow:(UIView*)aView;//动画放大--缩小
- (NSString *)getIPAddress;
- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

//- (void)updateStateAndExc:(UIViewController*)navSelf;//切换服务器  或 服务器异常调用
@end

