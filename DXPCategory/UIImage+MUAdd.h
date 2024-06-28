//
//  UIImage+MUAdd.h
//  MetaphysicsOC
//
//  Created by 严贵敏 on 2018/9/3.
//  Copyright © 2018年 严贵敏. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIImage (MUAdd)

//从图片正中间拉伸
+(UIImage *)resizingMiddleStretchWithImage:(UIImage *)image;
//平铺
+(UIImage *)resizingModeTileWithImage:(UIImage *)image;

+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
