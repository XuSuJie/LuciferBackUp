//
//  PersonalMessage.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/21.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MOFSPickerManager.h>
#import "NetWorkManager.h"
@interface PersonalMessage : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@property UIButton* button;//完善信息按钮
@property UIButton* prebtn;
@property UIButton* nextbtn;
@property NSString* token;
@property NSMutableArray* Interest;//标签数组
@property NSString* Name;
@property NSString* Sex;
@property NSArray* Array1;//高考所在地
@property NSArray* Array2;//学校所在地
@property NSString* School;
@property NSString* Grade;
@property NSString* Class;
@property NSMutableDictionary* dictionary;
@property NSDictionary* dictionary1;
@property UIPickerView* picker;
@end
