//
//  ChooseInterestViewController.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/21.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DBSphereView.h>
#import "NetWorkManager.h"
#define BUTTON_SIZE CGRectMake(0,0,40, 30)
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@interface ChooseInterestViewController : UIViewController
@property UIButton* button;//选择兴趣按钮
@property UIButton* nextbtn;
@property(strong,nonatomic) NSMutableArray* interest;//已选择标签，存储字符串
@property NSMutableArray* tags;//全部标签，存储按钮
@property NSDictionary* dictionary;
@property NSString* token;
@end
