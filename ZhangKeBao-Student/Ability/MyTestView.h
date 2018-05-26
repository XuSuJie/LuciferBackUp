//
//  MyTestView.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RadioButton/RadioButton.h>
@interface MyTestView : UIView
@property (strong, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) IBOutlet RadioButton *RadioButton1;
@property (strong, nonatomic) IBOutlet RadioButton *RadioButton2;
@property (strong, nonatomic) IBOutlet RadioButton *RadioButton3;
- (IBAction)select:(RadioButton*)btn;

@property(strong,nonatomic) NSArray* qaArray;
@property NSInteger page;
@property UIButton* confirmBtn;
@end
