//
//  LoginViewController.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/17.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImage.h"
#import "LoginedUser.h"
#import "Textfield.h"
#import "RegisterViewController.h"
#import "NetWorkManager.h"
#import "LoadingView.h"
#import "TencentOpenAPI.framework/Headers/TencentOAuth.h"
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
#define SIZE_SHIFT (CGFloat)[UIScreen mainScreen].bounds.size.width/750
@interface LoginViewController : UIViewController<TencentSessionDelegate>{
    UITextField *phoneText;
    UITextField *passwdText;
}
@property TencentOAuth* tencentOAuth;
@property NSArray* permissions;
@end
