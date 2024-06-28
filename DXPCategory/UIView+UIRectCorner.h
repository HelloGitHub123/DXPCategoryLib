//
//  UIView+UIRectCorner.h
//  GaiaCLP
//
//  Created by 严贵敏 on 2022/7/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UIRectCorner)
/**
 设置任意圆角及边框(实线/虚线)
 
 @param corners 要设置的圆角位置集合
 @param radius 圆角半径
 @param lineWidth 边框宽度
 @param lineColor 边框颜色
 @param lineDashPattern 虚线集合
 */
- (void)rounderWithCorners:(UIRectCorner)corners radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *_Nullable )lineColor dash:(NSArray<NSNumber *>*_Nullable )lineDashPattern;
/**
 设置任意圆角 --- 性能优化

 @param corners 要设置的圆角位置集合
 @param radius 圆角半径
 */
- (void)rounderWithCorners:(UIRectCorner)corners radius:(CGFloat)radius;


/**
 设置圆角 --- 性能优化

 @param radius 圆角半径
 */
- (void)roundCornerWithRadius:(CGFloat)radius;
@end

NS_ASSUME_NONNULL_END
