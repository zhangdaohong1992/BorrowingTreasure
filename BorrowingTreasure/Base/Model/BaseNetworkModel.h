//
//  BaseNetworkModel.h
//  Treasure
//
//  Created by 苹果 on 15/10/20.
//  Copyright © 2015年 YDS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@class AppDelegate;
@protocol BaseNetworkDelegate <NSObject>

@optional
- (void)successfulWithValue:(id)value method:(NSString *)method;

- (void)errorWith:(NSError *)error method:(NSString *)method;

@end

@interface BaseNetworkModel : NSObject

+ (id)shareBaseNetwork;
@property (nonatomic, strong) AFHTTPSessionManager * manager;
@property (nonatomic, weak) id<BaseNetworkDelegate> delegate;
@property (nonatomic, strong)AppDelegate *delegates;

- (void)postWithParameter:(NSDictionary *)parameter method:(NSString *)method isHud:(BOOL)isHud;
- (void)postWithParameter:(NSDictionary *)parameter method:(NSString *)method;

- (void)getWithMethod:(NSString *)method isHud:(BOOL)isHud;
- (void)getWithMethod:(NSString *)method;
- (void)getWithMethod:(NSString *)method Parameter:(NSDictionary *)parameter isHud:(BOOL)isHud;

+ (NSDictionary *)getSafeDicWithDic:(NSDictionary *)parameter method:(NSString *)method;


@end
