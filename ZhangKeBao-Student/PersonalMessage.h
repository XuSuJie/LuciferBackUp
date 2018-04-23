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
@property NSArray* Array1;//高考所在地
@property NSArray* Array2;//学校所在地
@property NSMutableDictionary* tags;//标签字典
@property NSDictionary* message;
@property UIPickerView* picker;
@property (weak, nonatomic) IBOutlet UITextView *ExamArea;
@property (weak, nonatomic) IBOutlet UITextView *SchoArea;
@property (weak, nonatomic) IBOutlet UISegmentedControl *SexSegment;
@property (weak, nonatomic) IBOutlet UITextField *NameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *SchoolTextfield;
@property (weak, nonatomic) IBOutlet UITextField *ClassTextfield;
@property (weak, nonatomic) IBOutlet UITextField *GradeTextfield;
-(IBAction)chooseExamPosition:(UIButton*)button;
@end
