//
//  ImputMessage.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseInterestViewController.h"
#import "PersonalMessage.h"
#import "RegisterSucceed.h"
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@interface ImputMessage : UIViewController

@property UIViewController* currentView;//当前显示视图
@property ChooseInterestViewController* view1;
@property PersonalMessage* view2;
@property RegisterSucceed* view3;
@property UIButton* button1;
@property UIButton* button2;
@property UIButton* button3;
@property NSString* token;

@end
