//
//  ButtonViewController.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/13.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "Textfield.h"

@implementation Textfield
- (instancetype)initWithFrame:(CGRect)frame Width:(NSInteger)width
{
    self = [super initWithFrame:frame];
    if (self) {
        _textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, width, 35)];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        UIImageView *Image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        Image.image = [UIImage imageNamed:@"bg_icon_intro"];
        _textField.leftView = Image;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        [self addSubview:_textField];
    }
    return self;
}
-(void)setPlaceholder:(NSString *)placeholder{
    _textField.placeholder=placeholder;
}
-(void)setSecureTextEntry:(BOOL)secureTextEntry{
    _textField.secureTextEntry=secureTextEntry;
}
-(NSString*)text{
    return _textField.text;
}
- (BOOL)hasText{
    return _textField.hasText;
}
@end
