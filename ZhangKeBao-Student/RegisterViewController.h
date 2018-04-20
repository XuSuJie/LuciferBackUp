//
//  RegisterViewController.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/3/31.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Textfield.h"
#import "LoadingView.h"
#import "ImputMessage.h"
@interface RegisterViewController : UIViewController{
    Textfield *phoneText;
    Textfield *passwdText;
    UITextField *captchaText;
    NSString* randchar;
    NSBlockOperation* block1;
    NSBlockOperation* block2;
}
@property int count;
@property UIButton* captBtn;
@property NSTimer* timer;
@property dispatch_queue_t queue;
@property  UILabel* label;
@end
