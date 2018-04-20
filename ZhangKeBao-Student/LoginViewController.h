//
//  LoginViewController.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/17.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Textfield.h"
#import "RegisterViewController.h"
#import "NetWorkManager.h"
#import "LoadingView.h"
@interface LoginViewController : UIViewController{
    Textfield *phoneText;
    Textfield *passwdText;
}
@end
