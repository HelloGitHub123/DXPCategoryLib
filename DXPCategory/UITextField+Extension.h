//
//  UITextField+Extension.h
//  GaiaCLP
//
//  Created by 严贵敏 on 2022/7/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 准许输入字符类型
typedef NS_ENUM(NSInteger, CharsType) {
    CharsType_numeral = 1,      // 只许数字
    CharsType_letter,           // 只许大小写字母
    CharsType_numeralAndXx,     // 只许数字加上X和x
    CharsType_numeralAndLetter, // 只许数字加上大小写字母
    CharsType_allChar,          // 允许输入所有字符
};


@interface UITextField (Extension)
/**
 *  格式化输入的文字
 *
 *  @param textField 正在输入的textField
 *  @param range     输入字符的位置
 *  @param string    输入的字符
 *  @param CharType  准许输入字符类型
 *  @param maxLength 限制输入文字的最大长度
 *  @param indexs    插入分隔符的位置下标数组
 *  @param separator 插入的分隔符号
 *
 *  @return 是否加显示到textField输入框内
 */
+ (BOOL)textField:(UITextField *)textField range:(NSRange)range string:(NSString *)string CharType:(CharsType)CharType maxLength:(NSInteger)maxLength separatorIndexs:(NSArray *)indexs separator:(NSString *)separator;

@end

NS_ASSUME_NONNULL_END
