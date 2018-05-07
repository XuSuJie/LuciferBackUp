//
//  LoginedUser.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/2.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "LoginedUser.h"

@implementation LoginedUser
+(instancetype)sharedInstance{
    static LoginedUser* userdata=nil;
    if (userdata == nil) {
        userdata= [[LoginedUser alloc]init];
    }
    return userdata;
}
@end
