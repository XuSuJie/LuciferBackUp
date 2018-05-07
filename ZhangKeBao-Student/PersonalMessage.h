//
//  PersonalMessage.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/21.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MOFSPickerManager.h>
#import "LoginedUser.h"
#import "NetWorkManager.h"
#import "drawGraphics.h"
@interface PersonalMessage : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@property UIButton* button;//完善信息按钮
@property UIButton* prebtn;
@property UIButton* nextbtn;
@property NSMutableArray* Interest;//标签数组
@property NSArray* Array;//高考所在地
@property NSMutableDictionary* tags;//标签字典
@property NSDictionary* message;
@property UIPickerView* picker;
@property UIImageView *imageView;
@property (strong, nonatomic)  UITextView *ExamArea;
@property (strong, nonatomic)  UISegmentedControl *SexSegment;
@property (strong, nonatomic)  UITextField *NameTextfield;
@property (strong, nonatomic)  UITextField *GradeTextfield;
-(void)chooseExamPosition:(UIButton*)button;
@end
