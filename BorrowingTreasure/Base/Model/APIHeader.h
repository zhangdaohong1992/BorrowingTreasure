//
//  APIHeader.h
//  Treasure
//
//  Created by 苹果 on 15/10/20.
//  Copyright © 2015年 YDS. All rights reserved.
//

#ifndef APIHeader_h
#define APIHeader_h

#define PATH  @"app5/"



//#if DEBUG
//
////测试环境
//#define BASE_URL [[NSUserDefaults standardUserDefaults]objectForKey:@"BASE_URL"]
//#define BASE_Notifition [[NSUserDefaults standardUserDefaults]objectForKey:@"BASE_Notifition"]
//
//#else

//正式环境
#define BASE_URL @"http://finger.shouzhiduobao.com/app5/"
#define BASE_Notifition @"http://finger.shouzhiduobao.com"

//#endif



static NSString * const getCellPhoneCheckCode = @"getCellPhoneCheckCode";/**<获取手机验证码*/
static NSString * const checkCellPhoneCheckCode = @"checkCellPhoneCheckCode";/**<验证手机验证码*/
static NSString * const login = @"login";/**<登陆*/
static NSString * const changePassword = @"changePassword";/**<修改密码*/
static NSString * const registe = @"register";/**<注册>*/

static NSString * const getUptoken = @"getUptoken";/**<获取上传凭证*/
static NSString * const updateUserInfo = @"updateUserInfo";/**<修改个人信息*/
static NSString * const getDuoBaoRecords = @"getDuoBaoRecords";/**<获取个人淘宝记录*/
static NSString * const getLuckyRecords = @"getLuckyRecords";/**<获取个人中奖记录*/
static NSString * const getUserInfo = @"getUserInfo";/**<获取个人信息*/
static NSString * const getIncomeBills = @"getIncomeBills";/**<获取个人流水账*/

static NSString * const getSlideShowAndNotice = @"getSlideShowAndNotice";/**<获取轮播图和通知*/
static NSString * const getItemsByCatagoryAndSort = @"getItemsByCategoryAndSort";/**<商品列表*/
static NSString * const getCategories = @"getCategories";/**<获取分类列表*/
static NSString * const getNewTerms = @"getNewTerms";/**<最新揭晓列表*/



static NSString * const getTGInfo = @"getTGInfo";/**<获取推广信息*/




#endif /* APIHeader_h */
