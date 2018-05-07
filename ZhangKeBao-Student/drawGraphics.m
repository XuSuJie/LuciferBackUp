//
//  drawGraphics.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "drawGraphics.h"

@implementation drawGraphics


// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self drawLine];
}
-(void)drawLine{
    //直线或折线
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //指定直线样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    //直线宽度
    CGContextSetLineWidth(context, 2.0);
    //设置颜色
    CGContextSetRGBStrokeColor(context, 0.9, 0.9, 0.9,1);
    //开始绘制
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 167, 88);
    CGContextAddLineToPoint(context, 314, 88);
    //绘制完成
    CGContextStrokePath(context);
    //开始绘制
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 167, 169);
    CGContextAddLineToPoint(context, 364, 169);
    //绘制完成
    CGContextStrokePath(context);
    //开始绘制
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 167, 208);
    CGContextAddLineToPoint(context, 314, 208);
    //绘制完成
    CGContextStrokePath(context);
}
@end
