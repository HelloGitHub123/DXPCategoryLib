//
//  NSString+MUAdd.h
//  MetaphysicsOC
//
//  Created by 严贵敏 on 2018/7/27.
//  Copyright © 2018年 严贵敏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MUAdd)

// URL编码
- (NSString *) URLEncoding;
// URL解码
- (NSString *) URLDecoding;
// 是否为空
- (BOOL) isEmpty;
// 是否相等
- (BOOL) isEqual:(NSString *)other;
// 是否用户名
- (BOOL) isUserName;
// 是否中文用户名
- (BOOL) isChineseUserName;
// 是否密码
- (BOOL) isPassword;
// 是否邮箱
- (BOOL) isEmail;
// 是否 URL
- (BOOL) isUrl;
// 是否手机号码
- (BOOL) isPhone;
//是否身份证号码
- (BOOL)IsIdCardNumber;
//是否固定电话
- (BOOL)isTel;
// 是否数字
- (BOOL) isDigital;

//判断是否为整形：
- (BOOL)isPureInt;
//判断是否为浮点形：
- (BOOL)isPureFloat;

//过滤html 标签
+ (NSString *)flattenHTML:(NSString *)htmlStr;
//时间戳转字符串
+ (NSString *)timestrToTimeSecond:(NSString *)timeStr;

//yyyymmddhhmmss转字符串 yyyy-mm-dd
+ (NSString *)timestrToTime:(NSString *)timeStr;


//yyyy-mm-dd转字符串yyyymmddhhmmss
+ (NSString *)timestrToTime2:(NSString *)timeStr;

/**
 *numberStr 需要断的字符串
 *index 间隔几位断
 */
+ (NSString *)NumberFormatWithString:(NSString *)numberStr index:(int)index;
@end
