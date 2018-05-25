//
//  MyTestView.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "MyTestView.h"

@implementation MyTestView
- (instancetype)init
{
    self = [super init];
    self = [[[NSBundle mainBundle]loadNibNamed:@"MyTestView" owner:self options:nil]lastObject];
    if (self) {
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)select:(RadioButton*)btn {
    [_qaArray[self.page] setObject:[NSString stringWithFormat:@"%c",(char)(btn.tag+65)] forKey:@"userAnswer"];
    NSLog(@"选择了%@",_qaArray[self.page][@"userAnswer"]);
    //判断是否已经全部回答
    NSInteger i=0;
    for (NSDictionary* dict in _qaArray) {
        if([dict[@"userAnswer"] containsString:@"3"])
            i++;
    }
    NSLog(@"回答了%ld道题",10-i);
    if (i==0) {
        _confirmBtn.enabled=YES;
    }
}
@end
