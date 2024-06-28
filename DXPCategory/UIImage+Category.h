//
//  UIImage+Category.h
//  LanTingDoctor
//
//  Created by 张威 on 2019/12/2.
//  Copyright © 2019 henglongwu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)

+ (UIImage *)md_imageNameWithNoCache:(NSString *)imageName;
/// 颜色转换为背景图片
/// @param color 颜色
+ (UIImage *)imageWithColor:(UIColor *)color;
/// 设置图片圆角
/// @param image 原图
/// @param cornerRadius 圆角
+ (UIImage *)setCornerWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;

+ (UIImage *)imageWithRoundCorner:(UIView *)view corner:(CGFloat)corner;
/**
把UIView 转换成图片
@param view
@return 图片
*/
+ (UIImage *)getImageFromView:(UIView *)view;
/**
 *  修改矢量图颜色
 *
 *  @param      maskColor 修改颜色
 *  @return
 */
- (UIImage *)imageMaskWithColor:(UIColor *)maskColor;

+ (UIImage *)svgNamed:(NSString *)svgNamed cgColor:(CGColorRef)cgColor skinLayer:(NSString *)skinLayer;

+ (UIImage *)svgNamed:(NSString *)svgNamed cgColor:(CGColorRef)cgColor;

+ (UIImage *)svgImageNamed:(NSString *)name tintColor:(UIColor *)tintColor;

+ (UIImage *)generateQrcodeImageWithStr:(NSString *)QcodeStr size:(float)size;
    
@end

NS_ASSUME_NONNULL_END
