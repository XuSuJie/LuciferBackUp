//
//  MyImageView.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/6.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImage : UIImage
//指定宽度等比例缩放图片
-(UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
@end
