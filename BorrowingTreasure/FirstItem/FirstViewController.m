//
//  FirstViewController.m
//  BorrowingTreasure
//
//  Created by 辰 on 16/8/13.
//  Copyright © 2016年 张道宏. All rights reserved.
//

#import "FirstViewController.h"
#import "GJAutoCycleScrollView.h"
#import "JoinRecordModel.h"


@interface FirstViewController ()<GJAutoCycleScrollViewDelegate, GJAutoCycleScrollViewDataSource>
@property (strong, nonatomic) GJAutoCycleScrollView *adScrollView;
@property (strong, nonatomic) NSMutableArray *imageNames;

@end

@implementation FirstViewController
- (GJAutoCycleScrollView *)adScrollView
{
    if (_adScrollView == nil) {
        self.adScrollView = [[GJAutoCycleScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_WIDTH/5*2)];
        self.adScrollView.delegate = self;
        self.adScrollView.dataSource = self;
    }
    return _adScrollView;
}

- (NSInteger)numberOfPagesInAutoCycleScrollView:(GJAutoCycleScrollView *)autoCycleScrollView
{
    return 2;
}

- (NSString *)autoCycleScrollView:(GJAutoCycleScrollView *)autoCycleScrollView imageUrlAtIndex:(NSInteger)index
{
    return @"http://wx.qlogo.cn/mmopen/Yx4T2mpgQiaib2bjAfbsInhuHQTiaSbuKBLM9y6a83GjAadmp6cYDHHBzJ2BlRuViarjU1pBUx0YdrWL51k5ibiayfD84AibYmAdTXA/0";
}

#pragma mark - GJAutoCycleScrollViewDelegate
- (void)autoCycleScrollView:(GJAutoCycleScrollView *)autoCycleScrollView didSelectPageAtIndex:(NSInteger)index
{
    
}



- (void)viewDidLoad {
    [super viewDidLoad];    

    [self.view addSubview:self.adScrollView];
    [self.network postWithParameter:@{@"page" : @(1)} method:getNewTerms];

}


#pragma mark - BaseNetworkDelegate
- (void)successfulWithDic:(NSDictionary *)dic method:(NSString *)method
{
    if ([method isEqualToString:getNewTerms]) {
        if ([self isPostSuccessedWithDic:dic]) {
            NSArray *arr = [JoinRecordModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"list"]];
            
            JoinRecordModel *model = arr[0];
            NSLog(@"model === %@",model.ip);

            
            
        }
    }
}





@end
