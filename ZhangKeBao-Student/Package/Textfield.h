//
//  ButtonViewController.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/13.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@interface Textfield : UITextField
@property(nonatomic,strong) UITextField* textField;
- (instancetype)initWithFrame:(CGRect)frame Width:(NSInteger)width;
//-(void)setPlaceholder:(NSString *)placeholder;
//-(void)setSecureTextEntry:(BOOL)secureTextEntry;
@end
