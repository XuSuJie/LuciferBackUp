//
//  LoginedUser.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/2.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginedUser : NSObject
+(instancetype)sharedInstance;
@property(nonatomic,strong) NSString* token;

@end
