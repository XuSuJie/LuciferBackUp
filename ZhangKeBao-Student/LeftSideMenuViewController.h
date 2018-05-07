//
//  LeftSideMenuViewController.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/30.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LGSideMenuController/LGSideMenuController.h>
#import <LGSideMenuController/UIViewController+LGSideMenuController.h>
#import "MyTableViewController.h"
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@interface LeftSideMenuViewController : UIViewController<UIGestureRecognizerDelegate>
@property LGSideMenuController* sidemenu;
@end
