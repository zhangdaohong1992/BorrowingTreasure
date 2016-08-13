//
//  ViewController.m
//  Treasure
//
//  Created by 苹果 on 15/10/19.
//  Copyright (c) 2015年 YDS. All rights reserved.
//

#import "ViewController.h"
#import "BaseNetworkModel.h"
#import "AppDelegate.h"
#import <AdSupport/AdSupport.h>
#import "UIImageView+AFNetworking.h"
//获取IP
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()
{
    UIWindow *windowView;
    UIView *bgView;
    UIButton *btnTimer;
    int nums;
    NSTimer *timer;
    
}
@property (nonatomic, strong) UIScrollView *pageScroll;//启动图

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIImage *image = [UIImage imageNamed:@"nav_bg_"];
    [self.navigationController.navigationBar setBackgroundImage:image
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"linkblack"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.network = [BaseNetworkModel shareBaseNetwork];
    self.network.delegate = self;

    self.noMoreDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.noMoreDataLabel.text = @"现在没有数据哦";
    self.noMoreDataLabel.center = self.view.center;
    self.noMoreDataLabel.hidden = YES;
    self.noMoreDataLabel.textAlignment = NSTextAlignmentCenter;
    self.noMoreDataLabel.textColor = [UIColor grayColor];
    [self.view addSubview:self.noMoreDataLabel];
//    AppDelegate *delegates = (AppDelegate *)[UIApplication sharedApplication].delegate;

    if ([self isFirstLaunch]) {
        [self firstGoToApp]; //引导页面；
//        delegates.reNum = 1;
        return;
    }
//
//    if (delegates.isreach) {
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"getKJMessage" object:nil];
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"DisPlayRedPages" object:@{@"state":@"0"}];
//        return;
//    }
//    
//    if (!delegates.reNum) {
//        windowView = [delegates window];
//        bgView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        bgView.backgroundColor = [UIColor whiteColor];
//        [windowView addSubview:bgView];
////        UIImageView *topImgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT - VIEW_HEIGHT / 4)];
//        UIImageView *topImgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
//
////        topImgv.contentMode = UIViewContentModeScaleAspectFill;
//        [bgView addSubview:topImgv];
//        
////        UIImageView *toPImgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT - VIEW_HEIGHT / 4 - 20)];
////        [bgView addSubview:toPImgv];
////
////        UIImageView *bottomImgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, VIEW_HEIGHT - VIEW_HEIGHT / 4-20, VIEW_WIDTH, VIEW_HEIGHT / 4 + 20)];
////        bottomImgv.image = [UIImage imageNamed:@"Default-bg"];
////        bottomImgv.contentMode = UIViewContentModeScaleAspectFill;
////        [bgView addSubview:bottomImgv];
//        
//        
//        
//        btnTimer = [[UIButton alloc]initWithFrame:CGRectMake(VIEW_WIDTH - 75, 50, 60, 25)];
//        btnTimer.backgroundColor = [UIColor darkGrayColor];
//        btnTimer.alpha = .7;
//        btnTimer.titleLabel.font = [UIFont systemFontOfSize:13.];
//        btnTimer.layer.masksToBounds = btnTimer.layer.cornerRadius = 5.;
//        nums = 5;
//        [btnTimer setTitle:[NSString stringWithFormat:@"跳 过%d",nums] forState:UIControlStateNormal];
//        [btnTimer addTarget:self action:@selector(clickCallRemov) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:btnTimer];
//        
//        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//        [timer fire];
//        
//        
//        AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
//        manager.requestSerializer.timeoutInterval = 20;
//        NSDictionary *dic =  [BaseNetworkModel getSafeDicWithDic:@{} method:@"getQdy"];
//        [manager POST:@"getQdy" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
//            
//            if (responseObject[DIC_DATA]) {
//                NSString *imgStr = [NSString stringWithFormat:@"%@",responseObject[DIC_DATA][@"imgurl"]];
////                [topImgv sd_setImageWithURL:[NSURL URLWithString:imgStr]];
//                
//                
//                NSURL *url = [NSURL URLWithString:imgStr];
//               
//                //请求网络地址数据的同步方法
//                SDWebImageManager *managerImage = [SDWebImageManager sharedManager];
//                if ([managerImage diskImageExistsForURL:url]) {
//                    
//                    topImgv.image = [[managerImage imageCache] imageFromDiskCacheForKey:url.absoluteString];
//                }else{
//                    
//                    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:url options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                        
//                    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//                        
//                        [[SDImageCache sharedImageCache] storeImage:image forKey:imgStr];
//                    }];
//                    
//                    NSData *data = [NSData dataWithContentsOfURL:url];
//                    topImgv.image = [UIImage imageWithData:data];
//                }
//            }
//            
//        } failure:^(NSURLSessionDataTask *task, NSError *error) {
//            [self clickCallRemov];//失败,关闭窗口显示
//        }];
//        
//        delegates.reNum = 1;
//    }

}

//- (void)clickCallRemov
//{
//    [timer invalidate];//关闭定时器
//    [bgView removeFromSuperview];
//    
//     AppDelegate *delegates = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    
//    if (USER_COOKIE) {
//        AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
//        manager.requestSerializer.timeoutInterval = 20;
//        NSDictionary *dic =  [BaseNetworkModel getSafeDicWithDic:@{COOKIE:USER_COOKIE} method:@"getKJMessage"];
//        [manager POST:@"getKJMessage" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
//            if (![responseObject[DIC_DATA][@"kjMessage"] isKindOfClass:[NSNull class]]) {
//                [[NSNotificationCenter defaultCenter]postNotificationName:@"getKJMessage" object:responseObject[DIC_DATA][@"kjMessage"]];
//            }else{
//             [[NSNotificationCenter defaultCenter]postNotificationName:@"getKJMessage" object:nil];
//            }
//            
//        } failure:^(NSURLSessionDataTask *task, NSError *error) {
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"getKJMessage" object:nil];
//        }];
//        
//        delegates.reNum = 1;
//        
//        return;
//    }
//#pragma -mark --未登录用户注册
//    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
//    manager.requestSerializer.timeoutInterval = 20;
//    NSString * idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    NSDictionary *dic =  [BaseNetworkModel getSafeDicWithDic:@{@"token":idfa} method:@"getYdzc"];
//    [manager POST:@"getYdzc" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
//        if (responseObject[DIC_DATA]) {
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"DisPlayRedPages" object:responseObject[DIC_DATA]];
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"error = %@", error);
//        
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"DisPlayRedPages" object:@{@"state":@"0"}];
//    }];
//
//    
//    
//}
//
//- (void)timerAction
//{
//    nums --;
//    if (nums == 0) {
//        [self clickCallRemov];
//    }
//    [btnTimer setTitle:[NSString stringWithFormat:@"跳过%d",nums] forState:UIControlStateNormal];
//    
//
//}


- (void)login
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController * nav = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - BaseNetworkDelegate
- (void)successfulWithValue:(id)value method:(NSString *)method
{
    if ([value isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dic = [NSDictionary dictionaryWithDictionary:value];
        NSLog(@"dic = %@", dic);
        [self successfulWithDic:dic method:method];
        if (![self isPostSuccessedWithDic:dic]) {
            
        [ResponseModel showInfoWithString:dic[DIC_INFO]];
            
        }
        if ([dic[DIC_ERRCODE] integerValue] == 2) {
            [self login];
        }
    }
}

- (void)errorWith:(NSError *)error method:(NSString *)method
{

}

- (BOOL)isPostSuccessedWithDic:(NSDictionary *)dic
{
    BOOL isSuccess = NO;
    if ([[dic objectForKey:DIC_ERRCODE] integerValue] == 0) {
        isSuccess = YES;
    }
    return isSuccess;
}

- (void)successfulWithDic:(NSDictionary *)dic method:(NSString *)method
{
    //subclass implementation
}

- (void)masksRadius:(UIView *)view1 numRadius:(float)floatNum
{
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = floatNum;
}


//引导页本地图片
- (void)firstGoToApp
{
    NSArray *imageNameArray = [NSArray arrayWithObjects:@"launchFirst.jpg", @"launchSecond.jpg", @"launchThird.jpg", nil];
    _pageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
    self.pageScroll.showsHorizontalScrollIndicator = NO;
    self.pageScroll.pagingEnabled = YES;
    self.pageScroll.contentSize = CGSizeMake(VIEW_WIDTH * imageNameArray.count, VIEW_HEIGHT);
    //设置弹动风格，默认值为YES
    self.pageScroll.bounces = NO;
    [[self mainWindow] addSubview:self.pageScroll];
    NSString *imgName = nil;
    for (int i = 0; i < imageNameArray.count; i++) {
        
        imgName = [imageNameArray objectAtIndex:i];
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((VIEW_WIDTH * i), 0.f, VIEW_WIDTH,VIEW_HEIGHT)];
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        imgV.image = [UIImage imageNamed:imgName];
        [self.pageScroll addSubview:imgV];
        if (i == imageNameArray.count - 1) {
            imgV.userInteractionEnabled = YES;
            UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectMake(0.f, 0.f, VIEW_WIDTH,VIEW_HEIGHT)];
            [enterButton addTarget:self action:@selector(pressEnterButton:) forControlEvents:UIControlEventTouchUpInside];
            [imgV addSubview:enterButton];}}
}
- (void)pressEnterButton:(UIButton *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(guideHidden)];
    self.pageScroll.frame = CGRectMake(0, VIEW_HEIGHT, VIEW_WIDTH, VIEW_HEIGHT);
    [UIView commitAnimations];
}
- (void)guideHidden //引导页隐藏处理
{
    [self.pageScroll removeFromSuperview];
    self.pageScroll = nil;
//    [self clickCallRemov];
}
- (UIWindow *)mainWindow //主屏幕
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {return [app.delegate window];
    }else{return [app keyWindow];}
}
- (BOOL)isFirstLaunch       //是否第一次运行；（或升级后第一次运行）
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
    float appVer = [[dicInfo objectForKey:@"CFBundleVersion"] floatValue];//读取版本号
    NSString  *newVer = [NSString stringWithFormat:@"%.2f",appVer];
    if ([userDefault objectForKey:@"firstLaunch"]) {
        NSString *verStr = [userDefault objectForKey:@"firstLaunch"];
        if (![verStr isEqualToString:newVer]) {
            [userDefault setObject:newVer forKey:@"firstLaunch"];
            [userDefault synchronize];
            return YES;
        }else{return NO;}
    }else{
        [userDefault setObject:newVer forKey:@"firstLaunch"];
        [userDefault synchronize];
        return YES;
    }
}

- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.4, 0.4, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}
//获取IP地址
- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}
- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGContextAddEllipseInRect(context, rect);
    UIGraphicsEndImageContext();
    return image;
}

//- (void)updateStateAndExc:(UIViewController*)navSelf
//{
//    
//    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
//    manager.requestSerializer.timeoutInterval = 20;
//    NSDictionary *dic =  [BaseNetworkModel getSafeDicWithDic:@{} method:updateState];
//    [manager POST:updateState parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//        if ([responseObject[@"errcode"] intValue] == 0) {
//            DHWebViewVC *vc = [[DHWebViewVC alloc]init];
//            vc.urlStr = [[dic[@"data"]allValues]lastObject];
//            vc.hidesBottomBarWhenPushed = YES;
//            vc.title = @"通 知";
//            [navSelf.navigationController pushViewController:vc animated:YES];
//        }
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        
//    }];
//    
//}


@end
