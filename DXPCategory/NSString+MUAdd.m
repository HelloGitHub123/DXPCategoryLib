//
//  NSString+MUAdd.m
//  MetaphysicsOC
//
//  Created by 严贵敏 on 2018/7/27.
//  Copyright © 2018年 严贵敏. All rights reserved.
//

#import "NSString+MUAdd.h"

@implementation NSString (MUAdd)
- (NSString *)URLEncoding{
    
    CFStringRef aCFString = CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault,
                                                                    (CFStringRef)self,
                                                                    NULL,
                                                                    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                    kCFStringEncodingUTF8 );
    NSString * result = (NSString *)CFBridgingRelease(aCFString);
    return result;
}
/**
 *  URLDecoding
 */
- (NSString *)URLDecoding{
    
    NSMutableString * string = [NSMutableString stringWithString:self];
    [string replaceOccurrencesOfString:@"+"
                            withString:@" "
                               options:NSLiteralSearch
                                 range:NSMakeRange(0, [string length])];
    return [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
/**
 *  是否为空
 */
-(BOOL)isEmpty{
    
    return [self length] > 0 ? NO : YES;
    
}
/**
 *  字符串比对
 */
- (BOOL) equal:(NSString *)other{
    
    return [self isEqualToString:other];
}
/**
 *  是否用户名(英文)
 */
- (BOOL)isUserName{
    NSString *        regex = @"(^[A-Za-z0-9]{3,20}$)";
    NSPredicate *    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
/**
 *  是否用户名(中文)
 */
- (BOOL)isChineseUserName{
    NSString *        regex = @"(^[A-Za-z0-9\u4e00-\u9fa5]{3,20}$)";
    NSPredicate *    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
/**
 *  是否密码(6到20位)
 */
- (BOOL)isPassword{
    NSString *        regex = @"(^[A-Za-z0-9]{6,20}$)";
    NSPredicate *    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
/**
 *  是否Email
 */
- (BOOL)isEmail{
    NSString *        regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
/**
 *  是否网页链接
 */
- (BOOL)isUrl{
    NSString *        regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
/**
 *  是否数字
 */
- (BOOL)isDigital{
    NSString *regex= @"(^[0-9*]{1,20}$)";
    NSPredicate *    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

//判断是否为整形：
- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner  scannerWithString:self];
    int val;
    return[scan  scanInt:&val] && [scan  isAtEnd];
}

//判断是否为浮点形：
- (BOOL)isPureFloat{
       NSScanner* scan = [NSScanner  scannerWithString:self];
       float  val;
       return[scan  scanFloat:&val] && [scan  isAtEnd];
}

/**
 *  是否电话号码
 */
- (BOOL)isPhone
{
    if (self == nil)
        return NO;
    
    //联通号码
    NSString *regex_Unicom = @"^(130|131|132|145|146|155|156|166|171|175|176|185|186|156|155)[0-9]{8}";
    //移动号码
    NSString *regex_CMCC = @"^(134|135|136|137|138|139|147|148|150|151|152|157|158|159|170|172|178|182|183|184|187|188|198|148)[0-9]{8}";
    //电信号码段(电信新增号段181)
    NSString *regex_Telecom = @"^(133|153|173|177|180|181|189|199)[0-9]{8}";
    NSPredicate *pred_Unicom = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex_Unicom];
    BOOL isMatch_Unicom = [pred_Unicom evaluateWithObject:self];
    NSPredicate *pred_CMCC = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex_CMCC];
    BOOL isMatch_CMCC = [pred_CMCC evaluateWithObject:self];
    NSPredicate *pred_Telecom = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex_Telecom];
    BOOL isMatch_Telecom = [pred_Telecom evaluateWithObject:self];
    if (isMatch_Unicom || isMatch_CMCC || isMatch_Telecom){
        return YES;
    }else{
        return NO;
    }
}
//是否固定电话
- (BOOL)isTel{
    NSString *regex= @"(0(([0-9]{2,3})|([0-9]{2,3}-))[0-9]{7,8})";
    NSPredicate *    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

//是否身份证号码
- (BOOL)IsIdCardNumber
{
    if (self.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}


+ (NSString *)flattenHTML:(NSString *)htmlStr {
    
    //  过滤html标签
    NSScanner *theScanner;
    NSString *text = nil;
    theScanner = [NSScanner scannerWithString:htmlStr];
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        htmlStr = [htmlStr stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    //  过滤html中的\n\r\t换行空格等特殊符号
    NSMutableString *str1 = [NSMutableString stringWithString:htmlStr];
    for (int i = 0; i < str1.length; i++) {
        unichar c = [str1 characterAtIndex:i];
        NSRange range = NSMakeRange(i, 1);

        //  在这里添加要过滤的特殊符号
        if ( c == '\r' || c == '\t' ) {
            [str1 deleteCharactersInRange:range];
            --i;
        }
    }
    htmlStr  = [NSString stringWithString:str1];
    
    return htmlStr;
}

/**
 *  URLEncode
 */
+ (NSString *)URLEncodedString:(NSString *)str
{
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *unencodedString = str;
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}



/**
 *  URLDecode
 */
+(NSString *)URLDecodedString
{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *encodedString = self;
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

+ (NSString *)timestrToTimeSecond:(NSString *)timeStr {//timestr 豪秒
    NSTimeInterval interval = [timeStr doubleValue]/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate: date];
    return dateString;
}


+ (NSString *)timestrToTime:(NSString *)timeStr {//timestr 豪秒
   
    NSMutableString *str =[NSMutableString new];
    
    [str appendString:[timeStr substringWithRange:NSMakeRange(0, 4)]];
    [str appendString:@"-"];
    [str appendString:[timeStr substringWithRange:NSMakeRange(4, 2)]];
    [str appendString:@"-"];
    [str appendString:[timeStr substringWithRange:NSMakeRange(6, 2)]];
   
    return str;
}

//yyyy-mm-dd转字符串yyyymmddhhmmss
+ (NSString *)timestrToTime2:(NSString *)timeStr{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *newdate =[formatter dateFromString:timeStr];

    NSDateFormatter *newFormatter1 = [[NSDateFormatter alloc] init];
    [newFormatter1 setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dateString = [newFormatter1 stringFromDate:newdate];
    
    return dateString;

}


/**
 *numberStr 需要断的字符串
 *index 间隔几位断
 */
+ (NSString *)NumberFormatWithString:(NSString *)numberStr index:(int)index{
    int yushu = numberStr.length%index;
    long total = numberStr.length/index;
    if (yushu!=0) {
        total += 1;
    }
    NSMutableString *str =[NSMutableString new];
    for (int i =0; i<total; i++) {
        if (i<total-1) {
            [str appendString:[numberStr substringWithRange:NSMakeRange(i*index, index)]];//
            [str appendString:@" "];
        }else{
            int length = index;
            if (yushu!=0) {
                length = MIN(yushu,index);
            }
            [str appendString:[numberStr substringWithRange:NSMakeRange(i*index, length)]];
        }

    }
    
    return str;
}

@end
